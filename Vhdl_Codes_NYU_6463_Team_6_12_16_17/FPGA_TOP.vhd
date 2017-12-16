------------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:    14:37:51 12/02/2017
-- Design Name:
-- Module Name:    FPGA_TOP - Behavioral
-- Project Name:
-- Target Devices:
-- Tool versions:
-- Description:
--
-- Dependencies:
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.Numeric_Std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.def.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FPGA_TOP is
  port(
    clk: in std_logic;
    -- Switches
    sw: in std_logic_vector(15 downto 0):= x"0000";
    -- Buttions
    BTNC, BTND, BTNL, BTNR, BTNU : in std_logic:= '0';
    --btn_i <= BTNU & BTNR & BTNL & BTND & BTNC;
	  -- LEDs
    LED: out std_logic_vector(15 downto 0);
	 LED16_b : out std_logic;
    --
	  SEVENSEGMENT	: out std_logic_vector(6 downto 0):= "0000000";
	  ANODE			: out std_logic_vector(7 downto 0):= "00000000";
	 --
	 cpu_resetn : in std_logic
  );
end FPGA_TOP;

architecture Behavioral of FPGA_TOP is
	
	--
	signal btn_rst : std_logic;
	signal en_data : std_logic;
	
  -- Slow clock for FPGA full RUN
  signal slowCLK: std_logic:='0';
  signal i_cnt: std_logic_vector(19 downto 0):=x"00000";

  -- MIPS_Top Signals
	signal MIPS_clk : std_logic;			 -- MIPS_Top's clk
	signal key_vld, enc, dec : std_logic;
  --
  signal PC_forced_flag : std_logic := '0';

	signal en_din, en_ukey : std_logic;

	signal ukey : std_logic_vector(127 downto 0);
	signal Din  : std_logic_vector(63 downto 0);

   signal halt_en : std_logic;

	signal key_rdy, enc_rdy, dec_rdy	: std_logic;
	--
	signal PC		  : STD_LOGIC_VECTOR(31 DOWNTO 0);
	Signal ALUResult : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL Instr : STD_LOGIC_VECTOR(31 DOWNTO 0);
	--
	signal rst_DMEM : STD_Logic:= '0';

	-- FPGA_TopModule Signals
  --
  signal state_flag : std_logic_vector(2 downto 0);
  --
	signal btn	: std_logic_vector(4 downto 0);
	--
	signal btn_i: std_logic_vector(4 downto 0);
	--
	signal ALU_OP : std_logic_vector(5 downto 0);

	signal REG	: Register_Data;
	signal MEM  : RAM_Array;
	signal RMEM_update : std_logic;
	signal DMEM_update : std_logic;
	signal SEGMENTS_DISPLAY: std_logic_vector(31 downto 0); -- BUFFER for 7-Segments DISPLAY

  signal SrcA, SrcB : STD_LOGIC_VECTOR(31 downto 0);

  signal Dout : STD_LOGIC_VECTOR(63 downto 0);

	-- Determine MIPS's clock (user decide to run Single step or ALL Instr)
	signal clk_detected 		 : STD_LOGIC:= '0';
	signal clk_detected_past : STD_LOGIC;

	-- FSM: Swithch from different Mode: Mode_Switch, KEY_Expansion, Encryption, Decryption, USER_Instr );
	TYPE RC5_Mode_Switch is ( Mode_Switch, KEY_Expansion, Encryption, Decryption, HALT_ENABLE );
	Signal FPGA_Mode : RC5_Mode_Switch;

	TYPE RUNorInput is ( RUN , RESET, Din_INPUT1, Din_INPUT2, Din_INPUT3, Din_INPUT4,Din_INPUT5, Din_INPUT6, ukey_INPUT1, ukey_INPUT2, ukey_INPUT3, ukey_INPUT4 , ukey_INPUT5, ukey_INPUT6, ukey_INPUT7, ukey_INPUT8, ukey_INPUT9, ukey_INPUT10, ukey_INPUT11);
	signal INPUTS_STATE : RUNorInput;
	signal BTND_cnt : std_logic_vector(2 downto 0):= "000";

  component top_code is
   port ( clk             : in    std_logic;
          clr_data_memory : in    std_logic;
          dec             : in    std_logic;
          Din             : in    std_logic_vector (63 downto 0);
          enc             : in    std_logic;
          en_din          : in    std_logic;
          en_ukey         : in    std_logic;
          halt_en         : in    std_logic;
          key_vld         : in    std_logic;
          ukey            : in    std_logic_vector (127 downto 0);
          ALUResult       : out   std_logic_vector (31 downto 0);
          --dec_rdy         : out   std_logic;
          Dout            : out   std_logic_vector (63 downto 0);
          --enc_rdy         : out   std_logic;
          Instr           : out   std_logic_vector (31 downto 0);
          --key_rdy         : out   std_logic;
          MemWrite        : out   std_logic;
          RAM_OUT         : out   RAM_Array;
          ReadData        : out   std_logic_vector (31 downto 0);
          RegWrite        : out   std_logic;
          REG_OUT         : out   Register_Data;
          SrcA            : out   std_logic_vector (31 downto 0);
          SrcB            : out   std_logic_vector (31 downto 0);
			 PC_FPGA         : out   std_logic_vector (31 downto 0));
	end component;

	component rc5_segmentdriver is
	    Port (
					clk:in std_logic;
				  -- displayA,displayB,displayC,displayD,displayE,displayF,displayG,displayH : in std_logic_vector(3 downto 0);
				  DISPLAY : IN STD_LOGIC_VECTOR(31 downto 0);
				  segA,segB,segC,segD,segE,segF,segG:out std_logic;
				  selectA,selectB,selectC,selectD,selectE,selectF,selectG,selectH:out std_logic);
	end component;

	component BTN_anti_coli is
		Port (
				clk		: in std_logic;
				BTN_i	: in std_logic_vector(4 downto 0);
				BTN_o	: out std_logic_vector(4 downto 0)
				);
	end component;

begin

  -- Slow clock for FPGA full RUN
  process(CLK)
  begin
  if (rising_edge(CLK)) then
  if (i_cnt=x"00064")then --Hex(186A0)=Dec(100,000)
  slowCLK<=not slowCLK; --slowCLK toggles once after we see 100000 rising edges of CLK. 2 toggles is one period.
  i_cnt<=x"00000";
  else
  i_cnt<=i_cnt+'1';
  end if;
  end if;
  end process;
  
  btn_rst <= not cpu_resetn;

--	-- Determine MIPS's clock
--	process( clk )
--		begin
--			if( sw(15) = '1' )then
--        if( Instr = "00101000000000001111111111111111" )then
--          MIPS_clk <= MIPS_clk;	-- let MIPS stop
--        else
--          --MIPS_clk <= clk;			-- full run
--          MIPS_clk <= slowCLK;
--        end if;
--			else
--				MIPS_clk <= btn(0);	-- signle steps
--			end if;
--	end process;

	-- INPUTS_STATE ( RUN , Din_INPUT1, Din_INPUT1, ukey_INPUT1, ukey_INPUT2, ukey_INPUT3, ukey_INPUT4);
	-- FSM: Swithch from different Mode: Mode_Switch, KEY_Expansion, Encryption, Decryption );
	process( clk )
		begin
			
			if rising_edge(clk) then
				
				LED16_b <= rst_DMEM;
				
          if( sw(15) = '1')then
            LED(15) <= '1';
          else
            LED(15) <= '0';
          end if;

          -- For FPGA Display ALU_OP on LED(10 downto 5)
          LED(10 downto 5) <= ALU_OP;

	  -- Decide what OP is going to be shown on LED(10 downto 5)
	  -- R-type shows Func_code
	  -- I/J type shows OP_code
	  -- while "HALT", let  key_rdy/ enc_rdy/ dec_rdy to '1'

		-- if( Instr(31 downto 26) = "111111" )then -- Halt
		if( Instr = "00101000000000001111111111111111" )then -- BEQ R0,R0 -1

        if key_vld = '1' then
          key_rdy <= '1';
        elsif enc = '1' then
          enc_rdy <= '1';
        elsif dec = '1' then
          dec_rdy <= '1';
        else
          key_rdy <= '0'; enc_rdy <= '0'; dec_rdy <= '0';
        end if;

    end if;
	 
		-- test for rest
		if ( BTNU = '1') then
			rst_DMEM <= '1';
		else
			rst_DMEM <= '0';
		end if;
		
--		-- write data memory
--		if ( BTND = '1') then
--			-- en_din <= '1';
--			-- en_ukey <= '1';
--		else
--			-- en_din <= '0';
--			-- en_ukey <= '0';
--		end if;

		LED(2) <= key_rdy; LED(1) <= enc_rdy; LED(0) <= dec_rdy;

      if Instr(31 downto 26) = "000000" then
        ALU_OP <= Instr(5 downto 0);
      else
        ALU_OP <= Instr(31 downto 26);
      end if;

					-- Swithc between run Instr and input din and ukey
					case INPUTS_STATE is
									when RUN =>

                  -- en_din <= '0';
                  -- en_ukey <= '0';

                  -- whenever the memory is updated, turn on the LED
                  LED(4) <= RMEM_update;
                  LED(3) <= DMEM_update;

						 -- 7-Segments Display
						 IF(sw(11) = '1')then
						 -- DISPLAY PC
							SEGMENTS_DISPLAY <= PC;
						 elsif(sw(10) = '1')then
						 -- DISPLAY INSTRUTIONS
							SEGMENTS_DISPLAY <= Instr;
						 elsif(sw(9) = '1')then
						 -- Display ALUResult
							SEGMENTS_DISPLAY <= ALUResult;
						 elsif(sw(8) = '1')then
						 -- DISPLAY RMEM
							SEGMENTS_DISPLAY <= REG(to_integer(unsigned(sw(5 downto 0))));
						 elsif(sw(7) = '1')then
						 -- DISPLAY
							SEGMENTS_DISPLAY <= MEM(to_integer(unsigned(sw(5 downto 0))));
						 elsif(sw(6) = '1')then
							SEGMENTS_DISPLAY(15 downto 0) <= din(31 downto 16);
						 end if;
				
		  if( sw(15) = '1' )then
			  if( Instr = "00101000000000001111111111111111" )then
				 MIPS_clk <= MIPS_clk;	-- let MIPS stop
			  else
				 --MIPS_clk <= clk;			-- full run
				 MIPS_clk <= not MIPS_clk;
			  end if;
		  else
				MIPS_clk <= btn(0);	-- signle steps
		  end if;
				 
             -- Reset
             if( btn(4) = '1' )then
               INPUTS_STATE <= RESET;
             else

             -- Determine the next state
             if ( btn(3) = '1')then
               INPUTS_STATE <= Din_INPUT1; -- input new Din
             elsif( btn(2) = '1')then
               INPUTS_STATE <= ukey_INPUT1; -- input new ukey
             else
               INPUTS_STATE <= RUN;         -- Default
             end if;

             end if;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
						Case FPGA_Mode is
							when Mode_Switch =>

                -- Things to do in this state
                --halt_en <= '0';

								-- Dispaly Mode Select
								LED(14 downto 12) <= "111";

                    if( sw(14 downto 12) = "100" and sw(14 downto 12) /= state_flag )then
                       FPGA_Mode <= KEY_Expansion;
                       key_vld <= '1'; enc <= '0'; dec <= '0';
                       halt_en <= '0';
                    elsif( sw(14 downto 12) = "010" and sw(14 downto 12) /= state_flag )then
                       FPGA_Mode <= Encryption;
                       key_vld <= '0'; enc <= '1'; dec <= '0';
                       halt_en <= '0';
                    elsif( sw(14 downto 12) = "001" and sw(14 downto 12) /= state_flag )then
                       FPGA_Mode <= Decryption;
                       key_vld <= '0'; enc <= '0'; dec <= '1';
                       halt_en <= '0';
                    else
                       FPGA_Mode <= Mode_Switch;
                       key_vld <= '0'; enc <= '0'; dec <= '0';
                       halt_en <= '0';
                    end if;

                -- end if;

---------------------------------------------------------------------------------------------------------------------------------------------------
							when KEY_Expansion =>
								-- Dispaly Mode Select
								LED(14 downto 12) <= "100";

								-- Things to do in this state
                key_vld <= '0'; enc <= '0'; dec <= '0';
                --
                state_flag <= "100";


                    -- Determine the next state
                    -- if( Instr(31 downto 26) = "111111")then HALT
						  if( Instr = "00101000000000001111111111111111")then
                      FPGA_Mode <= HALT_ENABLE;
                    else
                      FPGA_Mode <= KEY_Expansion;
                    end if;

                --end if;
---------------------------------------------------------------------------------------------------------------------------------------------------
							when Encryption =>
								-- Dispaly Mode Select
								LED(14 downto 12) <= "010";

                -- Things to do in this state
                key_vld <= '0'; enc <= '0'; dec <= '0';
                --
                state_flag <= "010";

                    -- Determine the next state
                    -- if( Instr(31 downto 26) = "111111")then
						  IF ( Instr = "00101000000000001111111111111111" ) then
                      FPGA_Mode <= HALT_ENABLE;
                    else
                      FPGA_Mode <= Encryption;
                    end if;

                -- end if;
---------------------------------------------------------------------------------------------------------------------------------------------------
							when Decryption =>
								-- Dispaly Mode Select
								LED(14 downto 12) <= "001";

                -- Things to do in this state
                key_vld <= '0'; enc <= '0'; dec <= '0';
                --
                state_flag <= "001";

                    -- Determine the next state
                    --if( Instr(31 downto 26) = "111111")then
						  IF ( Instr = "00101000000000001111111111111111" ) then
                      FPGA_Mode <= HALT_ENABLE;
                    else
                      FPGA_Mode <= Decryption;
                    end if;

                -- end if;
---------------------------------------------------------------------------------------------------------------------------------------------------
              when HALT_ENABLE =>
                -- Things to do in this state
                halt_en <= '1';
                key_vld <= '0'; enc <= '0'; dec <= '0';

                -- Determine the next state
                FPGA_Mode <= Mode_Switch;

              when others =>
								LED(14 downto 12) <= "000";

								SEGMENTS_DISPLAY <= x"00000000";

								-- Things to do in this state
								key_vld <= '0'; enc <= '0'; dec <= '0';

					end Case;


---------------------------------------------------------------------------------------------------------------------------------------------------------------------
                  when RESET =>

                              -- Dispaly Mode Select
                              LED <= x"FFFF";

                              SEGMENTS_DISPLAY <= x"FFFFFFFF";

                              -- set PC = x"00000000";
                              key_vld <= '1';

                              -- Determine the next state
                              if( btn(4) = '1')then
                                       -- to reset DMEM skey[0-25]
                                       rst_DMEM <= '1';
                                       INPUTS_STATE <= RESET;

                              elsif( btn(4)='0') then
                                        rst_DMEM <= '0';

                                        INPUTS_STATE <= RUN;
                              end if;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
									when Din_INPUT1 => LED(15 downto 8) <= "00010000";

                              -- en_din <= '0';
                              -- en_ukey <= '0';

															Din(63 downto 52) <= sw(11 downto 0);
															SEGMENTS_DISPLAY(11 downto 0) <= sw(11 downto 0);

                              -- Reset
                              if( btn(4) = '1' )then
                                INPUTS_STATE <= RESET;
                              else

                              -- Determine the next state
															if ( btn(3) = '1')then
																INPUTS_STATE <= Din_INPUT2;
															else
																INPUTS_STATE <= Din_INPUT1;
															end if;

                              end if;

									when Din_INPUT2 => LED(15 downto 8) <= "00100000";

                              -- en_din <= '0';
                              -- en_ukey <= '0';

															Din(51 downto 40) <= sw(11 downto 0);
															SEGMENTS_DISPLAY(11 downto 0) <= sw(11 downto 0);


                              -- Reset
                              if( btn(4) = '1' )then
                                INPUTS_STATE <= RESET;

                              else
                              -- Determine the next state
															if ( btn(3) = '1')then
																INPUTS_STATE <= Din_INPUT3;
															else
																INPUTS_STATE <= Din_INPUT2;
															end if;

                              end if;

									when Din_INPUT3 => LED(15 downto 8) <= "00110000";

                              -- en_din <= '0';
                              -- en_ukey <= '0';

															Din(39 downto 28) <= sw(11 downto 0);
															SEGMENTS_DISPLAY(11 downto 0) <= sw(11 downto 0);


                              -- Reset
                              if( btn(4) = '1' )then
                                INPUTS_STATE <= RESET;
                              else
                              -- Determine the next state
															if ( btn(3) = '1')then
																INPUTS_STATE <= Din_INPUT4;
															else
																INPUTS_STATE <= Din_INPUT3;
															end if;

                              end if;

									when Din_INPUT4 => LED(15 downto 8) <= "01000000";

                              -- en_din <= '0';
                              -- en_ukey <= '0';

															Din(27 downto 16) <= sw(11 downto 0);
															SEGMENTS_DISPLAY(11 downto 0) <= sw(11 downto 0);


                              -- Reset
                              if( btn(4) = '1' )then
                                INPUTS_STATE <= RESET;
                              else
                              -- Determine the next state
															if ( btn(3) = '1')then
																-- INPUTS_STATE <= WRITE_DATA;  
																INPUTS_STATE <= Din_INPUT5;  
															else
																INPUTS_STATE <= Din_INPUT4;
															end if;

                              end if;
										

										
										when Din_INPUT5 => LED(15 downto 8) <= "01010000";

                              -- en_din <= '0';
                              -- en_ukey <= '0';

															Din(15 downto 4) <= sw(11 downto 0);
															SEGMENTS_DISPLAY(11 downto 0) <= sw(11 downto 0);


                              -- Reset
                              if( btn(4) = '1' )then
                                INPUTS_STATE <= RESET;
                              else
                              -- Determine the next state
															if ( btn(3) = '1')then
																-- INPUTS_STATE <= WRITE_DATA;  
																INPUTS_STATE <= Din_INPUT6;  
															else
																INPUTS_STATE <= Din_INPUT5;
															end if;

                              end if;
										
										when Din_INPUT6 => LED(15 downto 8) <= "01100000";

                              -- en_din <= '0';
                              -- en_ukey <= '0';

															Din(3 downto 0) <= sw(3 downto 0);
															SEGMENTS_DISPLAY(11 downto 0) <= sw(11 downto 0);


                              -- Reset
                              if( btn(4) = '1' )then
                                INPUTS_STATE <= RESET;
                              else
                              -- Determine the next state
															if ( btn(3) = '1')then
																-- INPUTS_STATE <= WRITE_DATA;  
																INPUTS_STATE <= RUN;  
															else
																INPUTS_STATE <= Din_INPUT6;
															end if;

                              end if;
									when ukey_INPUT1 => LED(15 downto 8) <= "00000001";

                              -- en_din <= '0';
                              -- en_ukey <= '0';

															ukey(127 downto 116) <= sw(11 downto 0);
															SEGMENTS_DISPLAY(11 downto 0) <= sw(11 downto 0);


                              -- Reset
                              if( btn(4) = '1' )then
                                INPUTS_STATE <= RESET;
                              else
                              -- Determine the next state
															if ( btn(2) = '1')then
																INPUTS_STATE <= ukey_INPUT2;
															else
																INPUTS_STATE <= ukey_INPUT1;
															end if;

                              end if;

									when ukey_INPUT2 => LED(15 downto 8) <= "00000010";

                              -- en_din <= '0';
                              -- en_ukey <= '0';

															ukey(115 downto 104) <= sw(11 downto 0);
															SEGMENTS_DISPLAY(11 downto 0) <= sw(11 downto 0);


                              -- Reset
                              if( btn(4) = '1' )then
                                INPUTS_STATE <= RESET;
                              else
                              -- Determine the next state
															if ( btn(2) = '1')then
																INPUTS_STATE <= ukey_INPUT3;
															else
																INPUTS_STATE <= ukey_INPUT2;
															end if;

                              end if;

									when ukey_INPUT3 => LED(15 downto 8) <= "00000011";

                              -- en_din <= '0';
                              -- en_ukey <= '0';

															ukey(103 downto 92) <= sw(11 downto 0);
															SEGMENTS_DISPLAY(11 downto 0) <= sw(11 downto 0);


                              -- Reset
                              if( btn(4) = '1' )then
                                INPUTS_STATE <= RESET;
                              else
                              -- Determine the next state
															if ( btn(2) = '1')then
																INPUTS_STATE <= ukey_INPUT4;
															else
																INPUTS_STATE <= ukey_INPUT3;
															end if;

                              end if;

									when ukey_INPUT4 => LED(15 downto 8) <= "00000100";

                              -- en_din <= '0';
                              -- en_ukey <= '0';

															ukey(91 downto 80) <= sw(11 downto 0);
															SEGMENTS_DISPLAY(11 downto 0) <= sw(11 downto 0);


                              -- Reset
                              if( btn(4) = '1' )then
                                INPUTS_STATE <= RESET;
                              else
                              -- Determine the next state
															if ( btn(2) = '1')then
																INPUTS_STATE <= ukey_INPUT5;
															else
																INPUTS_STATE <= ukey_INPUT4;
															end if;

                              end if;

									when ukey_INPUT5 => LED(15 downto 8) <= "00000101";

                              -- en_din <= '0';
                              -- en_ukey <= '0';

															ukey(79 downto 68) <= sw(11 downto 0);
															SEGMENTS_DISPLAY(11 downto 0) <= sw(11 downto 0);


                              -- Reset
                              if( btn(4) = '1' )then
                                INPUTS_STATE <= RESET;
                              else
                              -- Determine the next state
															if ( btn(2) = '1')then
																INPUTS_STATE <= ukey_INPUT6;
															else
																INPUTS_STATE <= ukey_INPUT5;
															end if;

                              end if;
									when ukey_INPUT6 => LED(15 downto 8) <= "00000110";

                              -- en_din <= '0';
                              -- en_ukey <= '0';

															ukey(67 downto 56) <= sw(11 downto 0);
															SEGMENTS_DISPLAY(11 downto 0) <= sw(11 downto 0);


                              -- Reset
                              if( btn(4) = '1' )then
                                INPUTS_STATE <= RESET;
                              else
                              -- Determine the next state
															if ( btn(2) = '1')then
																INPUTS_STATE <= ukey_INPUT7;
															else
																INPUTS_STATE <= ukey_INPUT6;
															end if;

                              end if;
									when ukey_INPUT7 => LED(15 downto 8) <= "00000111";

                              -- en_din <= '0';
                              -- en_ukey <= '0';

															ukey(55 downto 44) <= sw(11 downto 0);
															SEGMENTS_DISPLAY(11 downto 0) <= sw(11 downto 0);


                              -- Reset
                              if( btn(4) = '1' )then
                                INPUTS_STATE <= RESET;
                              else
                              -- Determine the next state
															if ( btn(2) = '1')then
																INPUTS_STATE <= ukey_INPUT8;
															else
																INPUTS_STATE <= ukey_INPUT7;
															end if;

                              end if;
									when ukey_INPUT8 => LED(15 downto 8) <= "00001000";

                              -- en_din <= '0';
                              -- en_ukey <= '0';

															ukey(43 downto 32) <= sw(11 downto 0);
															SEGMENTS_DISPLAY(11 downto 0) <= sw(11 downto 0);


                              -- Reset
                              if( btn(4) = '1' )then
                                INPUTS_STATE <= RESET;
                              else 
                              -- Determine the next state
															if ( btn(2) = '1')then
--																INPUTS_STATE <= WRITE_DATA;  
																INPUTS_STATE <= ukey_INPUT9;  
															else
																INPUTS_STATE <= ukey_INPUT8;
															end if;

                              end if;
										
										when ukey_INPUT9 => LED(15 downto 8) <= "00001001";

                              -- en_din <= '0';
                              -- en_ukey <= '0';

															ukey(31 downto 20) <= sw(11 downto 0);
															SEGMENTS_DISPLAY(11 downto 0) <= sw(11 downto 0);


                              -- Reset
                              if( btn(4) = '1' )then
                                INPUTS_STATE <= RESET;
                              else 
                              -- Determine the next state
															if ( btn(2) = '1')then
--																INPUTS_STATE <= WRITE_DATA;  
																INPUTS_STATE <= ukey_INPUT10;  
															else
																INPUTS_STATE <= ukey_INPUT9;
															end if;

                              end if;


										when ukey_INPUT10 => LED(15 downto 8) <= "00001010";

                              -- en_din <= '0';
                              -- en_ukey <= '0';

															ukey(43 downto 32) <= sw(11 downto 0);
															SEGMENTS_DISPLAY(11 downto 0) <= sw(11 downto 0);


                              -- Reset
                              if( btn(4) = '1' )then
                                INPUTS_STATE <= RESET;
                              else 
                              -- Determine the next state
															if ( btn(2) = '1')then
--																INPUTS_STATE <= WRITE_DATA;  
																INPUTS_STATE <= ukey_INPUT11;  
															else
																INPUTS_STATE <= ukey_INPUT10;
															end if;

                              end if;


									when ukey_INPUT11 => LED(15 downto 8) <= "00001011";

                              -- en_din <= '0';
                              -- en_ukey <= '0';

															ukey(7 downto 0) <= sw(7 downto 0);
															SEGMENTS_DISPLAY(7 downto 0) <= sw(7 downto 0);


                              -- Reset
                              if( btn(4) = '1' )then
                                INPUTS_STATE <= RESET;
                              else 
                              -- Determine the next state
															if ( btn(2) = '1')then
--																INPUTS_STATE <= WRITE_DATA;  
																INPUTS_STATE <= RUN;  
															else
																INPUTS_STATE <= ukey_INPUT11;
															end if;

                              end if;


										
--									when WRITE_DATA => LED(15 downto 8) <= "11111111";
--										
----										-- en_ukey <= '1'; -- write ukey(127 downto 0) to DataMemory
----										-- en_din <= '1'; -- write Din(63 downto 0) to DataMemory
--										
--															-- Determine the next state
--															if ( btn(1) = '1')then
----																-- en_ukey <= '0'; 
----																-- en_din <= '0'; 
--																
--																INPUTS_STATE <= RUN;  
--															else
----																-- en_ukey <= '1'; 
----																-- en_din <= '1'; 
--																
--																INPUTS_STATE <= WRITE_DATA;
--															end if;
									
					end case;


		end if;

	end process;

  -- PORT MAP --------------------------------------------------------------------
  -- Group Project top port map
  MIPS: top_code port map(
--	  clk => clk,
    clk => MIPS_clk,
    clr_data_memory => rst_DMEM,
    --
    key_vld => key_vld,
    enc => enc,
    dec => dec,
    --
    halt_en => halt_en,
    --
    en_din => en_din,
    en_ukey => en_ukey,
    ukey => ukey,
    Din => Din,
		--
--	 key_rdy => key_rdy,
--    enc_rdy => enc_rdy,
--	 dec_rdy => dec_rdy,
--		--
    MemWrite => DMEM_update,
    RegWrite => RMEM_update,
	 REG_OUT => REG,
	 RAM_OUT => MEM,
	 --
	 Instr => Instr,
	 --ALU_OP => ALU_OP,
	 --
	 ALUResult => ALUResult,
    SrcA => SrcA,
    SrcB => SrcB,
    Dout => Dout,
	 PC_FPGA => PC
  );

	btn_i <= BTNU & BTNR & BTNL & BTND & BTNC;
	
	en_din <= BTND;
	en_ukey <= BTND;

	-- This Module prevents Buttons detect Collision Signals
	BTN_ANTI: BTN_anti_coli port map(
    clk => clk,
		-- Assign Buttons information for BTN_anti_coli to do the anti-Collision.
    BTN_i => btn_i,
    BTN_o => btn
	);

  -- This Module is Decode the MIPS singal & Data for USER uses.
	rc5_segment: rc5_segmentdriver port map(
		clk => clk,
		segA => SEVENSEGMENT(0),
		segB => SEVENSEGMENT(1),
		segC => SEVENSEGMENT(2),
		segD => SEVENSEGMENT(3),
		segE => SEVENSEGMENT(4),
		segF => SEVENSEGMENT(5),
		segG => SEVENSEGMENT(6),
		selectA => ANODE(0),
		selectB => ANODE(1),
		selectC => ANODE(2),
		selectD => ANODE(3),
		selectE => ANODE(4),
		selectF => ANODE(5),
		selectG => ANODE(6),
		selectH => ANODE(7),
		DISPLAY(3 downto 0) 	=> SEGMENTS_DISPLAY(3 downto 0),
		DISPLAY(7 downto 4) 	=> SEGMENTS_DISPLAY(7 downto 4),
		DISPLAY(11 downto 8) => SEGMENTS_DISPLAY(11 downto 8),
		DISPLAY(15 downto 12)  => SEGMENTS_DISPLAY(15 downto 12),
		DISPLAY(19 downto 16)  => SEGMENTS_DISPLAY(19 downto 16),
		DISPLAY(23 downto 20)  => SEGMENTS_DISPLAY(23 downto 20),
		DISPLAY(27 downto 24)  => SEGMENTS_DISPLAY(27 downto 24),
		DISPLAY(31 downto 28)  => SEGMENTS_DISPLAY(31 downto 28)
	);


end Behavioral;

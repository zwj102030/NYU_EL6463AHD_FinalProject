/*
Weijian Zhang
11/20/2017
this program conver the file from assembly to machine code

with type

ADD/ADDI/SUB.....JMP,HAL
R1-R31 could use
MIPS Arch
*/

#include<iostream>
#include<string>
#include<vector>
#include<bitset>
#include<fstream>
#include <stdlib.h>

using namespace std;
bitset<32> conveter_to_machine_code(string operation, string First_Value, string Sec_Value, string Thrid_Value);
int counter;//gobal counter
int main() {

	ifstream theFile("Assembly.txt");
	ofstream fileout;
	vector <string>  operation;
	vector <string> First_Value;
	vector <string> Sec_Value;
	vector <string> Thrid_Value;
	bitset<32> code;
	string  operation_temp;
	string First_Value_temp;
	string Sec_Value_temp;
	string Thrid_Value_temp;
	counter = 0;
	if (theFile.is_open())
	{
		while (theFile >> operation_temp >> First_Value_temp >> Sec_Value_temp >> Thrid_Value_temp)
		{
			operation.push_back(operation_temp);
			First_Value.push_back(First_Value_temp);
			Sec_Value.push_back(Sec_Value_temp);
			Thrid_Value.push_back(Thrid_Value_temp);
		}

	}
	else cout << "Unable to open file";
	theFile.close();
	//done with reading file 
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	if (remove("Results.txt") != 0)
		perror("Error deleting file");
	else
		puts("File successfully deleted");
	//delet  output file if there is arealdy one   
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	fileout.open("Results.txt", std::ios_base::app);
	if (fileout.is_open())
	{	
		for (int i = 0; i < operation.size(); i++)
		{
			
			code = conveter_to_machine_code(operation[i], First_Value[i], Sec_Value[i], Thrid_Value[i]);
			counter++;
			fileout << char(34) << code << char(34) << char(44) << endl;


		}
		fileout << char(34) << bitset<32>(0xFFFFFFFF) << char(34) << endl;
	}
	else cout << "Unable to write file";
	fileout.close();

	return 0;
}

bitset<32> conveter_to_machine_code(string operation, string First_Value, string Sec_Value, string Thrid_Value)
{
	bitset <32> Value_1, Value_2, Value_3;
	bitset <32> opcode, fncode;
	bitset <32> code;
	Value_1, Value_2, Value_3, opcode, fncode, code = 0;
	if (operation == "ADD" || operation == "SUB" || operation == "AND" || operation == "OR" || operation == "NOR") //R-type
	{
		First_Value = First_Value.erase(0, 1);
		Sec_Value = Sec_Value.erase(0, 1);
		Thrid_Value = Thrid_Value.erase(0, 1);
		opcode = 0;
		Value_1 = bitset<32>(stoi(First_Value)) << 21;
		Value_2 = bitset<32>(stoi(Sec_Value)) << 16;
		Value_3 = bitset<32>(stoi(Thrid_Value)) << 11;
		if (stoi(First_Value) > 32 || stoi(Sec_Value) > 32 || stoi(Thrid_Value) > 32)
		{

			cout << "Regesitor has number greater than 32      RS" << stoi(First_Value) << "RS" << stoi(Sec_Value) << " RD " << stoi(Thrid_Value)<<endl;
			exit(-1);
		}
		else 
		{
			if (operation == "ADD")
				fncode = 0x10;
			else if (operation == "SUB")
				fncode = 0x11;
			else if (operation == "AND")
				fncode = 0x12;
			else if (operation == "OR")
				fncode = 0x13;
			else if (operation == "NOR")
				fncode = 0x14;
			else
			{
				fncode = 0;
			}
		}
	}
	else if (operation == "ADDI" || operation == "SUBI" || operation == "ANDI" || operation == "ORI" || operation == "SHL" || operation == "SHR" || operation == "BEQ" || operation == "BNE" || operation == "BLT" || operation == "LW" || operation == "SW")//I-type
	{
		First_Value = First_Value.erase(0, 1);
		Sec_Value = Sec_Value.erase(0, 1);

		Value_1 = bitset<32>(stoi(First_Value)) << 21;
		Value_2 = bitset<32>(stoi(Sec_Value)) << 16;
		Value_3 = bitset<32>(bitset<16>(stoi(Thrid_Value)).to_ulong());
		if (stoi(First_Value) > 32 || stoi(Sec_Value) > 32)
		{

			cout << "Regesitor has number greater than 32      RS" << stoi(First_Value) << "RT" << stoi(Sec_Value) << endl;
			exit(-1);
		}
		else {
			if (operation == "ADDI")
				opcode = 0x01;
			else if (operation == "SUBI")
				opcode = 0x02;
			else if (operation == "ANDI")
				opcode = 0x03;
			else if (operation == "ORI")
				opcode = 0x04;
			else if (operation == "SHL")
				opcode = 0x05;
			else if (operation == "SHR")
				opcode = 0x06;
			else if (operation == "LW")
				opcode = 0x07;
			else if (operation == "SW")
				opcode = 0x08;
			else if (operation == "BEQ")
				opcode = 0x0A;
			else if (operation == "BNE")
				opcode = 0x0B;
			else if (operation == "BLT")
				opcode = 0x09;

			else
				opcode = 0x0;
		}

	}
	else if (operation == "JMP") //J-type
	{
		opcode = 0x0c;
		Value_1 = bitset<32>(stoi(First_Value));
	}
	else
	{	
		
		cout<<"Line" << counter<<"there is no"<< operation<< " operation "<<endl;
		exit(-1);
	}
	opcode = opcode << 26;
	code = bitset <32>(opcode.to_ulong() + Value_1.to_ulong() + Value_2.to_ulong() + Value_3.to_ulong() + fncode.to_ulong());
	return code;
};
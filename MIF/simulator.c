#include <stdio.h>

typedef struct{
	
	unsigned char first_byte , second_byte;
	
}instruction;


instruction program[1024];		//instruction memory

unsigned char memory[256];		//data memory

int run_program(int num_ins){
	
	int pc = -1;
	unsigned char reg[16], fb, sb;
	
	while( ++pc < (num_ins)){
		
		fb = program[pc].first_byte;
		sb = program[pc].second_byte;
		
		switch( fb >> 4){
			case 0: reg[fb & 0x0f] = memory[sb];printf("0!\n");break;
			case 1: memory[sb] = reg[fb & 0x0f];printf("1!\n");break;
			case 2: memory[reg[fb & 0x0f]] =
					reg[sb >> 4];printf("2!\n"); break;
			case 3: reg[fb & 0x0f] = sb;printf("3!\n");break;
			case 4: reg[fb &0x0f] += reg[sb >> 4];printf("4!\n");break;
			case 5: reg[fb & 0x0f]-= reg[sb >> 4];printf("5!\n");break;
			case 6: if(reg[fb & 0x0f]==0x00) {pc += sb; printf("6!\n");}break;
			case 7: if(reg[fb & 0x0f]==0x00) {pc -=sb; printf("7!\n");} break;
			default: return -1;
		}
	}
	return 0;	
		
	}

void print_memory_contents(){
	
	FILE *out;
	char outlog_name[] ="output.txt";
	int i = 0;
	out = fopen(outlog_name,"wb+");
	
	char prompt[] = "The memory content is: ";
	printf("The memory content is %d\n", memory[i]);
	
	
	
	fprintf(out,"%s %d %s %d","The", i,"th byte of the memory content is",memory[0]);
	
	fclose(out);
	
	// return 0;
}

/*function binary_file_convert is intended to convert the "0" and "1" ASCII
code to 0 and 1 binary file.

for fread function, no matter how many bytes it reads every time, the element in  
character array will be always 1 byte.
*/

void binary_file_convert(char inputFile[]){
	
	// printf("%s\n",inputFile);
	
	char outputFile[] = "binary.txt";
	
	FILE* f,* fb;
	
	f = fopen(inputFile,"rb");
	fb = fopen(outputFile,"w");
	
	unsigned char macCode[1024]; 
	
	int num_of_bytes = fread(macCode,1,sizeof(macCode),f);			//Now every element of macCode is a "0" or "1" in txt file.
	
	printf("number of bits is %d\n",num_of_bytes);
	// printf("%c\n",macCode[2]);
	
	int flag = 0;
	unsigned char b[5];
	unsigned char bin[128];
	for(int i = 0; i < num_of_bytes/4 ; i++)
	{	
		
		b[0] = macCode[4*i]  ;
		b[1] = macCode[4*i+1];
		b[2] = macCode[4*i+2];
		b[3] = macCode[4*i+3];
		
		// printf("b is %s\n",b);									//For Debug
		
		if(flag == 0){
			int p = i/2;
			if(!strcmp(b,"0000"))	  bin[p] = 0b00000000; 
			else if(!strcmp(b,"0001"))bin[p] = 0b00010000; 
			else if(!strcmp(b,"0010"))bin[p] = 0b00100000; 
			else if(!strcmp(b,"0011"))bin[p] = 0b00110000; 
			else if(!strcmp(b,"0100"))bin[p] = 0b01000000;
			else if(!strcmp(b,"0101"))bin[p] = 0b01010000;
			else if(!strcmp(b,"0110"))bin[p] = 0b01100000;
			else if(!strcmp(b,"0111"))bin[p] = 0b01110000;
			else bin[p] = 0;	
			
			// printf("bin%d is %d\n",p,bin[p]);					//For Debug
			// fputc(bin[p],fb);
			flag = 1;
			}
		else{
			int q = (i-1)/2;
			// printf("q = %d\n",q);
			if(!strcmp(b,"0000"))	  bin[q] = bin[q] + 0x00; 		//For second bit, it has 16 cases, not 8!
			else if(!strcmp(b,"0001"))bin[q] = bin[q] + 0x01; 
			else if(!strcmp(b,"0010"))bin[q] = bin[q] + 0x02; 
			else if(!strcmp(b,"0011"))bin[q] = bin[q] + 0x03; 
			else if(!strcmp(b,"0100"))bin[q] = bin[q] + 0x04;
			else if(!strcmp(b,"0101"))bin[q] = bin[q] + 0x05;
			else if(!strcmp(b,"0110"))bin[q] = bin[q] + 0x06;
			else if(!strcmp(b,"0111"))bin[q] = bin[q] + 0x07;
			else if(!strcmp(b,"1000"))bin[q] = bin[q] + 0x08;
			else if(!strcmp(b,"1001"))bin[q] = bin[q] + 0x09;
			else if(!strcmp(b,"1010"))bin[q] = bin[q] + 0x0a;
			else if(!strcmp(b,"1011"))bin[q] = bin[q] + 0x0b;
			else if(!strcmp(b,"1100"))bin[q] = bin[q] + 0x0c;
			else if(!strcmp(b,"1101"))bin[q] = bin[q] + 0x0d;
			else if(!strcmp(b,"1110"))bin[q] = bin[q] + 0x0e;
			else if(!strcmp(b,"1111"))bin[q] = bin[q] + 0x0f;
			else bin[q] = 0;
			
			// printf("bin%d updated is %d\n",q,bin[q]);			//For Debug
			fputc(bin[q],fb);
			flag = 0;
		}
	}
	
	// printf("the first byte of bin is %s\n",bin);
	fclose(f);
	fclose(fb);

	
}



/* This program is not useful as fread works well*/
void readInstructions(FILE* f){
	int flag = 0;
	int i = 0;
	while(1){
		if(feof(f))break;
		
		if(flag == 0){ 
			program[i].first_byte = fgetc(f);
			
			flag = 1;
		}
		else{
			program[i].second_byte = fgetc(f);
			i++;
			flag = 0;
		}
	}
	printf("i= %d\n",i);
}


/*
	Main function have two arguments: int argc and char *argv[].
	argc stands for the number of arguments input in the command line.
	argv[] stands for every arguments that are input.
	Example: 
	./simulator test.txt
	then:	argc = 2;
			argv[0] = "./simulator"
			argv[1] = "test.txt"
	
*/


int main (int argc, char *argv[]){
	
	FILE* ifs;
	int num_of_instructions;
	// printf("argc = %d",argc);
	// printf("argv = %s", argv[1]);
	
	binary_file_convert(argv[1]);
	
	char binaryFile[] = "binary.txt";
	
		
	ifs = fopen(binaryFile,"rb");
	
	if( argc!=2 || ( ifs == NULL))
	{
		printf("Read File Failed!");
		return -1;

	}
	
	num_of_instructions = fread(program,2,1024,ifs);
	
	// readInstructions(ifs);
	
	
	// printf("Hello World");
	printf("total number of bytes is %d bytes\n", num_of_instructions * 2);
	// printf("%s\n",program);
	
	unsigned char fb = program[1].first_byte;
	unsigned char sb = program[1].second_byte;	
	
	printf("fb is :%d\n",fb);
	printf("sb is :%d\n",sb);
	// printf("fb &0x0f is :%d\n",fb & 0x0f);
		
	
	
	run_program(num_of_instructions);
	print_memory_contents();
	
	
	return 0;
	/********** Read file test good*****************/
	
	
	
	
	// if(run_program(fread(program,sizeof(program))) == 0)
	// {
		// print_memory_contents();
		// return(0);
	// }
	// else return(-1);
	
}














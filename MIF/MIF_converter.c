#include <stdio.h>
#include<String.h>


int main(int argc, char* argv[])
{
    //har const* const fileName = argv[1]; /* should check that argc > 1 */
    
	char fileName[] = "input.coe";
	//char fileName[] = "test.txt";
	char MIFName[]  = "MIF.txt";
	FILE* file = fopen(fileName, "rb"); /* should check the result */
    FILE* MIF  = fopen(MIFName,"w+");
	char line[256];
	int i = 0;
    
	////////////// Write head for MIF file//////////////////////
	fputs("%  multiple-line comment\n",MIF);
	fputs("multiple-line comment  %\n",MIF);
	fputs("-- single-line comment\n",MIF);
	fputs("DEPTH = 256;                   -- The size of data in bits\n",MIF);
	fputs("WIDTH = 16;                    -- The size of memory in words\n",MIF);
	fputs("ADDRESS_RADIX = HEX;          -- The radix for address values\n",MIF);
	fputs("DATA_RADIX = BIN;             -- The radix for data values\n",MIF);
	fputs("CONTENT                       -- start of (address : data pairs)\n",MIF);
	fputs("BEGIN\n",MIF);
	char zeros[] = "000000000000000000000000000000000000000000000000";
	char cat[100];
	char *pos;
	
	while (!feof(file)){
		//for(int j = 0; j < 4; j++){
        
		if(fgets(line, sizeof(line), file) != NULL){				//Caution: If EOF is encountered, the str remain unchanged!
																	//But the return value will be NULL.
		i++;
		if(i<3)continue;
		
		char prefix[] = ()

		
		strcpy(cat,zeros);
		strcat(cat,line);
		
		//printf("%c\n",cat[strlen(cat)-3]);
		cat[strlen(cat)-2]='\0';
		strcat(cat,";\n");
		//printf("%s",cat);
		fputs(cat,MIF);
		
		}
		
		
    }
	
	fputs("END",MIF);
    //printf("%d",sizeof(line));
	

	fclose(file);
	fclose(MIF);
    
	
	
	return 0;
}





char* hex_convert(int dNum) {
	long int dNum,remainder,quotient;
	int i=1,j,q = 0,temp;
	char hexNum_rev[100];
	char hexNum[100];
	quotient = dNum;
	while(quotient!=0) {
		temp = quotient % 16;
		//To convert integer into character
		if( temp < 10)
		           temp =temp + 48; else
		         temp = temp + 55;
		hexNum_rev[i++]= temp;
		quotient = quotient / 16;
	}
	//printf("Equivalent hexadecimal value of decimal number %d: ",decimalNumber);
	for (j = i -1 ;j> 0;j--){
		hexNum[q] = hexNum_rev[j];
		q++;
		//printf("%c",hexNum[j]);
	}
	
	return hexNum;
}











/*printf("original: %s",line);
	if ((pos=strchr(line, '\n')) != NULL) {
		printf("true!");
		* pos = '\0';
	}
	printf("real:%s",line);*/
/* input too long for buffer, flag error */
	
   // printf("%s", line); 
	   
	   
	   
	   

/*if ((pos=strchr(cat, '\n')) != NULL) {
//printf("true!");
* pos = '\0';
}
*/
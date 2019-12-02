#include <stdio.h>



char *return_and_pass(char s[])	// OR char return_and_pass(char *s)
{
	s[0]='A'; //modify passed string
	return s;	//return it
}
 
 
char* hex_convert(int dNum) {
	long int remainder,quotient;
	int i=1,j,q = 2,temp;
	char hexNum_rev[100];
	char hexNum[4]="000";
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
	for (j = 1 ;j < i;j++){
		hexNum[q] = hexNum_rev[j];
		q--;
		//printf("%c",hexNum[j]);
	}
	//printf("%s",hexNum);
	return hexNum;
}
 
 
 
 char* return_my_name()
{
	char* name;					//Should use String pointers!
    char name1[7] = "Jiajun";
	name = name1;
	return name;
}
 
int main()
{
	char a[]="Hello!";
	char *b;
	b = return_my_name();
	strcat(a,b);
	printf("%s",a);
	
	
	
	//int a = 100;
	//char* b;
	//b = hex_convert(a);
	//printf("%s",return_my_name());
	
	
	return 0;
}
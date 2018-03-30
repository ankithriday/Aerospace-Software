/*Ankit Hriday
ASEN 4057
Midterm Part-2
29th March, 2018
*/

#include<stdlib.h>
#include<stdio.h>
#include<string.h>
#include<math.h>
#include<ctype.h>


// Defining functions to be used later in the script
int linear_search(int* array, int length, int target_num);
int binary_search(int* array, int length, int target_num);

// Argument format: Array.in target_num
int main(int argc, char* argv[]){ 

// Define the variables to use
int i=0;
char line [80];
int sort;
FILE *fp; // Make a pointer to the file
int target_num = atoi(argv[2]); 


// Open the file and read the number of lines
fp = fopen(argv[1],"r");

int ch=0;
int lines=0;

  while (!feof(fp)){
      ch = fgetc(fp);
      if (ch == '\n'){
      	lines++;
      }
    }

fclose(fp);

int length = lines; //length of array

// Dynamically allocate memory into array
int* array = malloc(length * sizeof(int));

//Open the file for reading and put it into an array
fp = fopen(argv[1],"r");


	while (fgets(line,sizeof line,fp)!=NULL){
		array[i] = atoi(line);
		i++;
	}

fclose(fp); // Close the file


// Check if the file is sorted
sort = 1; // Assume its sorted

	for (i=0; i <length-1;i++){
		if (array[i] > array[i+1])
		sort = 0;
	}


// Write to the output file
char* basename = strtok(argv[1],".");
strcat(basename,".out");


// If the files is not sorted, use linear search
if (sort==0){
	int Index; 
	Index = linear_search(array, length,target_num);
	if (Index > -1)
	{
		fp=fopen(basename,"a");
		fprintf(fp,"The position of %d is %d\n",target_num,Index+1);
		printf("The position of %d is %d\n",target_num,Index+1);
		fclose(fp);
	}
	else
	{
		fp=fopen(basename,"a");
		fprintf(fp,"The number %d does not exist in array!\n",target_num);
		printf("The number %d does not exist in array!\n",target_num);
		fclose(fp);
	}
	
}
// If it is sorted, use binary search
else{
	int M;
	M = binary_search(array, length, target_num);
	if (M < 0)
	{
		fp=fopen(basename,"a");
		fprintf(fp,"The number %d does not exist in array!\n",target_num);
		printf("The number %d does not exist in array!\n",target_num);
		fclose(fp);
	}
	else
	{
		fp=fopen(basename,"a");
		fprintf(fp,"The position of %d is %d\n",target_num,M+1);
		printf("The position of %d is %d\n",target_num,M+1);
		fclose(fp);
	}
}

return 0;
}

// Linear Search Function
int linear_search(int* array, int length, int target_num){
int i;
int Index;

for (i = 0;i<length;i++){
	if (array[i] == target_num){
		Index = i;
		return Index;
	}
}
	return -1;
}

// Binary Search Function
int binary_search(int* array, int length, int target_num){
int L=0;
int R = length;
int M;
 while (L < R){
  M =  (L+R-1)/2;
  if (target_num==array[M])
  	return M; //Found.
  else if (target_num < array[M])
  R = M; //First half
  else
  L = M+1; //Second half
}
return -1; //Number not in array
} 
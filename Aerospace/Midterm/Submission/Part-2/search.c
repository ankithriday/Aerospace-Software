/*Ankit Hriday
ASEN 4057
Midterm Part-2
29th March, 2018
*/

// Include Libraries
#include<string.h>
#include<math.h>
#include<ctype.h>
#include<stdlib.h>
#include<stdio.h>


// Defining functions to be used later in the script
int lin_search(int* array, int size, int target);
int bin_search(int* array, int size, int target);

// Argument format: Array.in target
int main(int argc, char* argv[]){ 

// Define the variables to use
int i=0;
char line [80];
int sortNumber;
FILE *f_p; // Make a pointer to the file
int target = atoi(argv[2]); 


// Open the file and read the number of linesNumber
f_p = fopen(argv[1],"r");

int ch=0;
int linesNumber=0;

  while (!feof(f_p)){
      ch = fgetc(f_p);
      if (ch == '\n'){
      	linesNumber++;
      }
    }

fclose(f_p);

int size = linesNumber; //size of array

// Dynamically allocating memory into array
int* array = malloc(size * sizeof(int));

// Opening the file for reading and putting it in arrays
f_p = fopen(argv[1],"r");


	while (fgets(line,sizeof line,f_p)!=NULL){
		array[i] = atoi(line);
		i++;
	}

fclose(f_p); // Close file


// Check file sortNumber
sortNumber = 1; // Assuming sortNumber

	for (i=0; i <size-1;i++){
		if (array[i] > array[i+1])
		sortNumber = 0;
	}


// Output file writing
char* base_n = strtok(argv[1],".");
strcat(base_n,".out");

// We use linear search if the file is not sortNumbered otherwise we use 
// binary search

// If the files is not sortNumbered, use linear search
if (sortNumber==0){
	int new_ind; 
	new_ind = lin_search(array, size,target);
	if (new_ind > -1)
	{
		f_p=fopen(base_n,"a");
		f_printf(f_p,"The position of %d is %d\n",target,new_ind+1);
		printf("The position of %d is %d\n",target,new_ind+1);
		fclose(f_p);
	}
	else
	{
		f_p=fopen(base_n,"a");
		f_printf(f_p,"The number %d does not exist in array!\n",target);
		printf("The number %d does not exist in array!\n",target);
		fclose(f_p);
	}
	
}
// If sortNumbered, using bin search
else{
	int M;
	M = bin_search(array, size, target);
	if (M < 0)
	{
		f_p=fopen(base_n,"a");
		f_printf(f_p,"The number %d does not exist in array!\n",target);
		printf("The number %d does not exist in array!\n",target);
		fclose(f_p);
	}
	else
	{
		f_p=fopen(base_n,"a");
		f_printf(f_p,"The position of %d is %d\n",target,M+1);
		printf("The position of %d is %d\n",target,M+1);
		fclose(f_p);
	}
}

return 0;
}


// Binary Search Function
int bin_search(int* array, int size, int target){
int L=0;
int R = size;
int M;
 while (L < R){
  M =  (L+R-1)/2;
  if (target==array[M])
  	return M; //Found.
  else if (target < array[M])
  R = M; //First half
  else
  L = M+1; //Second half
}
return -1; //Number not in array
} 


// Linear Search Function
int lin_search(int* array, int size, int target){
int i;
int new_ind;

for (i = 0;i<size;i++){
	if (array[i] == target){
		new_ind = i;
		return new_ind;
	}
}
	return -1;
}
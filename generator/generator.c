#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdint.h>

#include "edx-io.h"

#define BUF_LEN 2097152
#define SM_BUF 256
#define eprintf(level, args...) if ( debug >= level ) printf (args)

typedef long long int lli;

enum OPTS { STDOUT, STRING };
FILE* input;
FILE* output;

char* arr_output(lli* int_arr, int size, enum OPTS opt);
char* arr_sort(lli* int_arr, int size, FILE* output);
uint8_t arr_is_sorted(lli* int_arr, int size);
lli* merge_sort(lli* arr, uint32_t b, uint32_t e);
lli* merge(lli* a1, lli* a2, uint32_t l1, uint32_t l2);
int int_to_buffer_(unsigned value, int pos);

int debug = 0;

int main(int argc, char** argv)
{
    int i = 0;
    lli* sorted_numbers;

    debug = argc - 1;
    edx_open();
    int size = edx_next_i32();
    
    lli numbers[size];
    for(; i < size; i++)
    {
        numbers[i] = edx_next_i64();
    }
    
    sorted_numbers = merge_sort(numbers, 1, size);
    
    for(i = 0; i < size - 1; i++)
    {
        edx_print_i64(sorted_numbers[i]), edx_print_char(' ');
    }
    edx_println_i64(sorted_numbers[i]);
    
    edx_close();
    
    return 0;
}

char*
arr_output(lli* int_arr, int size, enum OPTS opt)
{
    char* arr_string = (char *) malloc(BUF_LEN);
    char* arr_str_curs = arr_string;

    int int_len = 0;
//    arr_str_curs += int_len;

    for(int i = 0; i < size; i++)
    {
        int_len = sprintf(arr_str_curs, "%lld ", int_arr[i]);
        arr_str_curs += int_len;
    }
    
    *(arr_str_curs - 1) = '\0';
    
    if( opt == STDOUT )
    {
        printf("array : [%s]\n", arr_string);
        free(arr_string);
    }

    return arr_string;
}

lli*
merge(lli* a1, lli* a2, uint32_t l1, uint32_t l2)
{
    if (!l1 )
        l1 = 1;
    if (!l2 )
        l2 = 1;
    ////eprintf(2, "merge(): l1 + l2 [%d]\n", l1 + l2);
    lli* merge_result = malloc((l1+l2) * sizeof(lli));

    uint32_t i1 = 0, i2 = 0, res_it = 0;
    while ( i1 < l1 || i2 < l2 )
    {
        if ( i2 == l2 || ( i1 < l1 && a1[i1] <= a2[i2] ) )
        {
            merge_result[res_it] = a1[i1], res_it++, i1++;
        }
        else
        {
            merge_result[res_it] = a2[i2], res_it++, i2++;
        }
    }

    ////eprintf(2, "merge() free a1: [%p]\ta2: [%p]\n", a1);
    //if ( l1 > 1 )
        //free(a1);
    //if ( l2 > 1 )
        //free(a2);   

    return merge_result;
}

//
// b - index starting from 1
// e - index with max = length(arr)
// returns sorted array or a part of it
//
lli*
merge_sort(lli* arr, uint32_t b, uint32_t e)
{
    //eprintf(2, "merge_sort() b [%d] e [%d]\n", b, e);

    if ( b == e )
    {
        return arr;
    }
        
    uint32_t m = ( e + b ) / 2;
    //eprintf(2, "merge_sort() m [%d] \n", m);
    lli* a1 = merge_sort(arr, b, m);
    lli* a2 = merge_sort(&arr[m + 1 - b], m + 1, e);
    lli* result = merge(a1, a2, m + 1 - b, e - m);

    edx_print_i32(b), edx_print_char(' ');
    edx_print_i32(e), edx_print_char(' ');
    edx_print_i64(result[0]), edx_print_char(' ');
    edx_println_i64(result[e-b]);

    return result;   
}

uint8_t arr_is_sorted(lli* int_arr, int size)
{
	uint8_t result = 1;
	for(size--; size > 0; size--)
	{
		if(int_arr[size] < int_arr[size-1])
		{
			result = 0;
            printf("unsorted\n");
			break;
		}
	}
    //
	return result;
}

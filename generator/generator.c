#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdint.h>
#include <time.h>

#include "edx-io.h"

#define RAND_MAX_LOCAL INT64_MAX

int main(int argc, char** argv)
{
    time_t t;
    srand((unsigned) time(&t));
    edx_open();
    long long int size = atoi(argv[1]);
    //double max_float = 1000000000.0;
    
    for(int i = 0; i < size; i++)
    {
        //edx_print_double((float)rand()/(float)(RAND_MAX) * max_float);
        for(int it = 0; it < atoi(argv[2]) - 1; it++)
        {
            edx_print_double(rand()%RAND_MAX_LOCAL);
            //edx_print_ui64(rand()%8196); 
            //edx_print_ui64(i); 
            //edx_print_char('|');
            //edx_print_char('a' + i % 20);
            //edx_print_char('|');
        }
        edx_println_char('|');
        //edx_println("");
    }
    
    edx_close();
    
    return 0;
}

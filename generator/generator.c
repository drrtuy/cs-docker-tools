#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdint.h>
#include <time.h>
#include <sys/types.h>
#include <sys/time.h>
#include <sys/wait.h>
#include <unistd.h>

#include "edx-io.h"

#define RAND_MAX_LOCAL INT64_MAX

typedef struct {
    uint32_t id;
    uint32_t cols;
    uint64_t recs;
} params_t;

void generator(params_t*);

int main(int argc, char** argv)
{
    uint64_t recs = atoi(argv[1]);
    uint64_t cols = atoi(argv[2]) - 1; 
    uint64_t procs = atoi(argv[3]);
    recs = recs / procs;
    int status;
    pid_t proc_pid = 0;
    params_t params = { 1, cols, recs };
    struct timespec ts = { 0, 10000 };

    for (uint8_t i = 1; i <= procs; i++)
    {
        proc_pid = fork();
        if(proc_pid == 0)
        {
            params.id = i;
            generator(&params);
            break;
        }
        else if ( proc_pid == -1 )
        {
            fprintf(stderr, "Couldn't fork\n");
        }
        else
        {
            printf("parent\n");
            nanosleep(&ts, NULL);
        }
    }  

    if ( proc_pid > 0 )
    {
        while((proc_pid = waitpid(-1, &status, 0) != -1))
        {
            printf("Process %d terminated\n", proc_pid);
        }
    }

}

void generator(params_t* params)
{
    struct timeval tv;
    gettimeofday(&tv, NULL);
    srand((unsigned) tv.tv_usec);
    edx_open(params->id);

    printf("id %d recs %ld cols %d\n", params->id, params->recs, params->cols); 
   
    for(int i = 0; i < params->recs; i++)
    {
        //edx_print_double((float)rand()/(float)(RAND_MAX) * max_float);
        for(int it = 0; it < params->cols; it++)
        {
            edx_print_double(rand()%RAND_MAX_LOCAL);
            //printf("%d\t%d\n", params->id, rand()%8196);
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
    
}

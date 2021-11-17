#ifndef DEBUG_H
#define DEBUG_H
    #ifdef DEBUG
        #define DBG(fmt, args...) printf("DBG: " fmt, args)                                                                          
    #else
        #define DBG(fmt, args...)
    #endif
#endif

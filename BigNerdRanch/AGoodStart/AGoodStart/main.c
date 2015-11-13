//
//  main.c
//  AGoodStart
//
//  Created by adminstrator on 15/10/2.
//  Copyright (c) 2015年 ddd.cc. All rights reserved.
//

#include <stdio.h>
#include <readline/readline.h>

int main(int argc, const char * argv[]) {
    // insert code here...
    printf("Who is cool?");
    const char* name = readline(NULL);
    printf("%s is cool!\n", name);
    
    printf("It was the best of times.\n");
    printf("It was the worst of times.\n");
    printf("Hello, World!\n");
    return 0;
}

#include <stdio.h>
#include "utils.h"

void msg_teste(void) {
    printf("Msg de teste da funcao msg_teste() em utils.h\n");
}

int main(){
    printf("Arquivo main.c carregado\n");
    msg_teste();
    return 0;
}
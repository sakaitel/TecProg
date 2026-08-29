#!/usr/bin/env bash

source "./lib/logger.sh"

verificar_arquivos_c() {
    local diretorio_fonte="${1:-src}"
    local qtde_arquivos_c

    if [[ ! -d "$diretorio_fonte" ]]; then
        log_error "O diretorio '$diretorio_fonte' nao existe."
        exit 1
    fi

    qtde_arquivos_c=$(find "$diretorio_fonte" -type f -name "*.c" 2>/dev/null | wc -l)

    if [[ "$qtde_arquivos_c" -eq 0 ]]; then
        log_error "Nenhum arquivo .c foi encontrado no diretorio '$diretorio_fonte'."
        exit 1
    fi
}
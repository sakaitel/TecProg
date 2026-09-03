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

limpar_projeto() {
    local diretorio_build="${1:-build}"

    if [[ -d "$diretorio_build" ]]; then
        rm -rf "$diretorio_build"
        log_info "Diretorio '$diretorio_build' removido com sucesso."
    else
        log_error "Diretorio '$diretorio_build' nao existe. Nada a limpar."
        exit 1
    fi
    find . -type f -name "*.o" -delete
}

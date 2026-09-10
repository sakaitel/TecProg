#!/usr/bin/env bash

source "./lib/logger.sh"

verificar_arquivos_c() {
    local diretorio_fonte="${1:-src}"
    local qtde_arquivos_c

    if [[ ! -d "$diretorio_fonte" ]]; then
        log_erro "O diretorio '$diretorio_fonte' nao existe."
        exit 1
    fi

    qtde_arquivos_c=$(find "$diretorio_fonte" -type f -name "*.c" 2>/dev/null | wc -l)

    if [[ "$qtde_arquivos_c" -eq 0 ]]; then
        log_erro "Nenhum arquivo .c foi encontrado no diretorio '$diretorio_fonte'."
        exit 1
    fi
}

limpar_projeto() {
    local diretorio_build="${1:-build}"

    if [[ -d "$diretorio_build" ]]; then
        rm -rf "$diretorio_build"
        log_info "Diretorio '$diretorio_build' removido com sucesso."
    else
        log_erro "Diretorio '$diretorio_build' nao existe. Nada a limpar."
        exit 1
    fi
    find . -type f -name "*.o" -delete
}

mapear_executaveis() {
    local diretorio_build="${1:-build}"
    local nome_binario="${NOME_EXECUTAVEL:-TecProg}"
    local arquivo_executavel="$diretorio_build/$nome_binario"

    if [[ ! -f "$arquivo_executavel" ]]; then
        log_erro "O arquivo executavel '$arquivo_executavel' nao foi encontrado"
        exit 1
    fi
    
    # arquivo existe
    # executa o binário se ele existir
}

construir_projeto() {
    
    local diretorio_build="${1:-build}"
    local diretorio_fonte="${DIRETORIO_FONTE:-src}"
    local nome_binario="${NOME_EXECUTAVEL:-TecProg}"
    
    mkdir -p "$diretorio_build"
    
    if gcc "$diretorio_fonte"/*.c -o "$diretorio_build/$nome_binario"; then
        log_info "Compilacao finalizada. Binario gerado em $diretorio_build/$nome_binario."
    else
        log_erro "Falha na compilacao com GCC na funcao build."
        exit 1
    fi
}

reconstruir_projeto() {
    limpar_projeto
    construir_projeto
}

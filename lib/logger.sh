#!/usr/bin/env bash

mkdir -p logs

ARQUIVO_LOGS="logs/execucao.log"

log_info() {
    local data_hora=$(date "+%Y-%m-%d %H:%M:%S")
    local comando="${COMANDO:-GERAL}"
    local mensagem="$1"

    # AAAA-MM-DD HH:MM:SS [comando] [INFO] - [explicacao]
    local entrada_log="${data_hora} [${comando}] [INFO] - ${mensagem}"
    
    echo "${entrada_log}"
    echo "${entrada_log}" >> "$ARQUIVO_LOGS"
}

log_erro() {
    local data_hora=$(date "+%Y-%m-%d %H:%M:%S")
    local comando="${COMANDO:-GERAL}"
    local mensagem="$1"

    # AAAA-MM-DD HH:MM:SS [comando] [ERRO] - [explicacao]
    local entrada_log="${data_hora} [${comando}] [ERRO] - ${mensagem}"

    echo "${entrada_log}" >&2
    echo "${entrada_log}" >> "$ARQUIVO_LOGS"
}

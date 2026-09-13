#!/usr/bin/env bash

if ! mkdir -p logs 2>/dev/null; then
    echo "[ERRO CRÍTICO] Não foi possível criar o diretório 'logs/'. Verifique as permissões de acesso." >&2
fi

ARQUIVO_LOGS="logs/execucao.log"

checar_permissao_log() {
    if [[ -d "logs" ]] && ! touch "$ARQUIVO_LOGS" 2>/dev/null; then
        echo "[AVISO DE SISTEMA] Sem permissão de escrita em '$ARQUIVO_LOGS'. O log não será gravado em disco." >&2
        return 1
    fi
    return 0
}

log_info() {
    local data_hora=$(date "+%Y-%m-%d %H:%M:%S")
    local comando="${COMANDO:-GERAL}"
    local mensagem="$1"

    # AAAA-MM-DD HH:MM:SS [comando] [INFO] - [explicacao]
    local entrada_log="${data_hora} [${comando}] [INFO] - ${mensagem}"
    
    echo "${entrada_log}"
    
    if checar_permissao_log; then
        echo "${entrada_log}" >> "$ARQUIVO_LOGS"
    fi
}

log_erro() {
    local data_hora=$(date "+%Y-%m-%d %H:%M:%S")
    local comando="${COMANDO:-GERAL}"
    local mensagem="$1"

    # AAAA-MM-DD HH:MM:SS [comando] [ERRO] - [explicacao]
    local entrada_log="${data_hora} [${comando}] [ERRO] - ${mensagem}"

    echo "${entrada_log}" >&2

    if checar_permissao_log; then
        echo "${entrada_log}" >> "$ARQUIVO_LOGS"
    fi
}
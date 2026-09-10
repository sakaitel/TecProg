#!/usr/bin/env bash

source "./lib/logger.sh"

carregar_configuracao() {
    local arquivo_config="${1:-cbuild.conf}"

    if [[ ! -f "$arquivo_config" ]]; then
        log_error "O arquivo de configuracao '$arquivo_config' nao foi encontrado"
        exit 1
    elif [[ ! -r "$arquivo_config" ]]; then
        log_error "O arquivo de configuracao '$arquivo_config' nao tem permissao de leitura"
        exit 1
    fi

    source "$arquivo_config"

    # fallback DEPOIS de carregar o config.
    NOME_EXECUTAVEL="${NOME_EXECUTAVEL:-TecProg}"
    DIRETORIO_FONTE="${DIRETORIO_FONTE:-src}"
    
    log_info "Configuracao carregada com sucesso de $arquivo_config."
}
#!/usr/bin/env bash

source "./lib/logger.sh"

carregar_configuracao() {
    local arquivo_config="cbuild.conf"

    # Valores padrão de reserva
    NOME_EXECUTAVEL="arquivo_executavel"
    DIRETORIO_FONTE="src"
    NIVEL_OTIMIZACAO="-O2"

    if [ -f "$arquivo_config" ]; then
        source "$arquivo_config"
        log_info "Configuracao carregada com sucesso de $arquivo_config."
    else
        log_info "Arquivo de configuracao nao encontrado. Usando padroes."
    fi
}
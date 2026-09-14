#!/usr/bin/env bash

source "./lib/logger.sh"

exibir_info() {
    local diretorio_fonte="${DIRETORIO_FONTE:-src}"
    local diretorio_include="${DIRETORIO_INCLUDE:-include}"
    local nome_executavel="${NOME_EXECUTAVEL:-TecProg}"
    local arquivo_logs="${ARQUIVO_LOGS:-logs/execucao.log}"
    local caminho_binario="build/$nome_executavel"

    local qtde_arquivos_c
    local qtde_arquivos_h
    local qtde_arquivos_total

    # echo em config.sh
    echo "Nome do executavel: $nome_executavel"
    echo "Diretorio Fonte: $diretorio_fonte"
    echo "Diretorio Include: $diretorio_include"

    # conta arquivos .c e .h SEPARADO
    qtde_arquivos_c=$(find "$diretorio_fonte" -type f -name "*.c" 2>/dev/null | wc -l)
    qtde_arquivos_h=$(find "$diretorio_include" -type f -name "*.h" 2>/dev/null | wc -l)
    qtde_arquivos_total=$((qtde_arquivos_c + qtde_arquivos_h))

    echo "Quantidade de arquivos: $qtde_arquivos_total"

    if [[ $qtde_arquivos_total -gt 0 ]]; then

        if [[ $qtde_arquivos_c -gt 0 ]]; then
            echo "Quantidade de linhas em arquivos .c e os arquivos:"
            wc -l "$diretorio_fonte"/*.c 2>/dev/null
        fi

        if [[ $qtde_arquivos_h -gt 0 ]]; then
            echo "Quantidade de linhas em arquivos .h e os arquivos:"
            wc -l "$diretorio_include"/*.h 2>/dev/null
        fi

    else
        log_erro "Diretorio fonte/include nao encontrado ou sem arquivos .c e .h"
    fi

    if [[ -f "$caminho_binario" ]]; then

        local tamanho_executavel
        tamanho_executavel=$(wc -c < "$caminho_binario" 2>/dev/null | tr -d ' ')
        local data_compilacao=$(date -r "$caminho_binario" "+%Y-%m-%d %H:%M:%S" 2>/dev/null)

        echo "Tamanho executavel: $tamanho_executavel bytes"
        echo "Data da ultima compilacao: $data_compilacao"

        if [[ -f "$arquivo_logs" ]]; then
            local data_ultima_execucao
            data_ultima_execucao=$(grep -i "\[run\]" "$arquivo_logs" 2>/dev/null | tail -n 1 | awk '{print $1, $2}')

            if [[ -n "$data_ultima_execucao" ]]; then
                echo "Data da ultima execucao: $data_ultima_execucao"
            else
                echo "Nenhuma execucao encontrada no arquivo de log."
            fi
        else
            log_erro "Arquivo de log ($arquivo_logs) nao encontrado"
        fi

    else
        log_erro "Arquivo executavel indisponivel: nao e possivel indicar tamanho ou data de compilacao"
    fi
}
#!/usr/bin/env bash

exibir_info() {

    local qtde_arquivos_c

#CONFIGURACOES ATIVAS CBUILD.CONF
    echo "Nome do executavel: $NOME_EXECUTAVEL"
    echo "Diretorio Fonte: $DIRETORIO_FONTE"

    qtde_arquivos_c=$(find "$DIRETORIO_FONTE" -type f -name "*.c" 2>/dev/null | wc -l)
    qtde_arquivos_h=$(find "$DIRETORIO_FONTE" -type f -name "*.h" 2>/dev/null | wc -l)
    qtde_arquivos_total=$(($qtde_arquivos_c + $qtde_arquivos_h))

#QUANTIDADE DE ARQUIVOS
    echo "Quantidade de arquivos: $qtde_arquivos_total"

    if [[ $qtde_arquivos_total -gt 0 ]]; then

#LINHAS DE CODIGO .c
        if [[ $qtde_arquivos_c -gt 0 ]]; then
            echo "Quantidade de linhas em arquivos .c e os arquivos: $(wc -l "$DIRETORIO_FONTE"/*.c)"
        fi

#LINHAS DE CODIGO .h
        if [[ $qtde_arquivos_h -gt 0 ]]; then
            echo "Quantidade de linhas em arquivos .h e os arquivos: $(wc -l "$DIRETORIO_FONTE"/*.h)"
        fi

    else
        log_erro "Diretorio fonte nao encontrado/vazio"
    fi


    if [[ -f "build/$NOME_EXECUTAVEL" ]]; then

    local tamanho_executavel=$(stat -c "%s" "build/$NOME_EXECUTAVEL")
    local data_compilacao=$(date -r "build/$NOME_EXECUTAVEL" "+%Y-%m-%d %H:%M:%S")

    echo "Tamanho executavel: $tamanho_executavel"
    echo "Data da ultima compilacao: $data_compilacao"

        if [[ -f "logs/execucao.log" ]]; then
            local data_ultima_execucao=$(grep "\[run\]" logs/execucao.log | tail -n 1 | awk '{print $1, $2}')
            if [[ -n "$data_ultima_execucao" ]]; then
                echo "Data da ultima execucao: $data_ultima_execucao"
            else
                echo "Nenhuma execucao encontrada no arquivo de log."
            fi

        else
            log_erro "Arquivo .log nao encontrado"

        fi



    else
        log_erro "Arquivo executavel indisponivel: nao e possivel indicar tamanho ou data de compilacao"
    fi



}
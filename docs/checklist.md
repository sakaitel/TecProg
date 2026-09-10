# Checklist pra acabar (preferencialmente dia 14 mas tudo cero)

## Gabi
* [ ] integrar flags do andre: ajustar o comando gcc dentro de construir_projeto (em builder.sh) para aceitar a as flags do andre () (ex: gcc $FLAGS_COMPILACAO "$DIRETORIO_FONTE"/*.c -o ...) -> FLAGS_COMPILACAO é -g ou -Wall
* [ ] TESTAR compilação complexa: criar arquivos .c e .h na pasta src/ e rodar o build para garantir que o comando gcc atual esta conseguindo compilar o projeto inteiro sem falhar
* [ ] compilacao incremental das funcionalidades adicionais: o build não pode compilar tudo do zero sempre,precisa compilar cada .c em um arquivo objeto .o dentro de build/. antes de chamar o gcc -c, usar o comparador de datas do bash (if [[ src/arquivo.c -nt build/arquivo.o ]]) para compilar só o que foi modificado

## Duda
* [ ] continuar a função rodar_executaveis (lib/builder.sh)
* [ ] em rodar_executaveis, antes de executar o binário, capturar a hora inicial. depois da execução, capturar a hora final. chamar o log_info assim: log_info "Execução iniciada em $hora_inicio e concluida em $hora_fim"

## Andre
* [ ] criar parte exibir_info (lib/config.sh): usar echos bonitinhos para imprimir um cabeçalho e os valores atuais das variáveis ($DIRETORIO_FONTE, $NOME_EXECUTAVEL, $DIRETORIO_BUILD, $DIRETORIO_LOGS), alem da contagem de linhas. LEMBRAR na contagem de FAZER UM IF ANTES para checar se existem arquivos .c na pasta, se nao tiver o projeto todo quebra :P
----> quantidade de arquivos .c e .h.
----> contagem de linhas (fazendo um if antes para não dar erro se a pasta estiver vazia).
----> tamanho do executável (usar du -h build/$NOME_EXECUTAVEL 2>/dev/null ou avisar que "dado está indisponível").
----> Datas da última compilação e execução (dica: dar um grep no logs/execucao.log buscando pela última linha q tenha [build] e [run]).

* [ ] modos --debug e --verbose (cbuild): pegar esses argumentos adicionais ( --debug e --verbose ) no terminal traduzi-las para as opções nativas do GCC (-g e -Wall respectivamente). jogue isso numa variável chamada FLAGS_COMPILACAO e repasse para o lib/builder.sh pra gabi :3

## Eu
* [ ] erro de compilação do GCC (lib/builder.sh): add a verificação logo após a Gabi rodar o gcc. Se o $? (código de retorno) for diferente de 0, acionar log_erro "Falha na compilação" e dar exit 1.
* [ ] gravar video e fazer PDF  
---
# Ja feitos
# Checklist pra acabar

## Gabi
* [X] `lib/logger.sh` -> add a criacao automatica da pasta `logs/` com `mkdir -p logs`
* [X] `lib/builder.sh` -> criar a função `limpar_projeto()` com `rm -rf build/` para apagar os arquivos binarios antigos (pasta `build/`) e avisar no log
* [X] `lib/builder.sh` -> build q corre a pasta `src/` em busca de arquivos c e roda o `gcc src/*.c -o "build/$NOME_EXECUTAVEL"`
* [X] `lib/builder.sh` -> rebuild q é clean e build em sequência

## Duda
* [X] `lib/builder.sh` -> testa o caminho onde o executavel gerado ta (`build/$NOME_EXECUTAVEL`)

## Andre

## Eu
* [X] gcc nao instalado -> cbuild: verificar_gcc()
* [X] sem diretorio e aquivos fonte -> lib/builder.sh: verificar_arquivos_c()
* [X] comando nao informado ou invalido -> cbuild: validar_comando()
* [x] erro de permissao -> cbiuld: verificar_permissao() 
* [X] adiantar base do relatório PDF (capa, introducao, estrutura USP) + organizar repositorio/`.gitignore`
* [X] `lib/config.sh`: `carregar_configuracao()` 
* [X] err exe sem gerar binario -> `lib/builder.sh`: add erro run` **(FALTA DUDA FAZER RUN 11/09)**
* [X] err compilacao gcc -> `lib/builder.sh`: add erro no build **(FALTA GABI FAZER BUILD 11/09)**
* [X] escrever o `README.md` completo no github com guia de uso, comandos e tabela de flags

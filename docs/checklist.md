# Checklist 1 e 2

## Gabi
**07/09: Logs e comando clean**
* [ ] `lib/logger.sh` -> add a criacao automatica da pasta `logs/` com `mkdir -p logs`
* [ ] `lib/builder.sh` -> criar a função `limpar_projeto()` com `rm -rf build/` para apagar os arquivos binarios antigos (pasta `build/`) e avisar no log

**11/09: Comandos build e rebuild**
* [ ] `lib/builder.sh` -> build q corre a pasta `src/` em busca de arquivos c e roda o `gcc src/*.c -o "build/$NOME_EXECUTAVEL"`
* [ ] `lib/builder.sh` -> rebuild q é clean e build em sequência

## Duda
**07/09: Estrutura basica e mapiar**
* [ ] `lib/builder.sh` -> testa o caminho onde o executavel gerado ta (`build/$NOME_EXECUTAVEL`)

**11/09 Comando run pronto**
* [ ] `lib/builder.sh` -> run executa `"./build/$NOME_EXECUTAVEL"`
* [ ] `lib/logger.sh` -> garantir que o `run` grave o inicio e o fim da execução do programa no log

## Andre
**07/09: Ver valores padrao e estats**
* [ ] `lib/config.sh` -> testa valores padrao caso alguma variavel seja apagada do `.conf` sem querer
* [ ] `cbuild` -> add a contagem de linhas de codigo em C (`wc -l src/*.c`) no painel do `info`

**11/09: Comando info + estatísticas do projeto**
* [ ] `cbuild` -> criar o painel do comando `info` exibindo as configs ativas do `cbuild.conf` com echo
* [ ] `lib/builder.sh` -> add modo debug (`-g`) e modo verboso 

## Eu
**07/09: erros**
* [X] gcc nao instalado -> cbuild: verificar_gcc()
* [X] sem diretorio e aquivos fonte -> lib/builder.sh: verificar_arquivos_c()
* [X] comando nao informado ou invalido -> cbuild: validar_comando()
* [x] erro de permissao -> cbiuld: verificar_permissao() 
* [ ] adiantar base do relatório PDF (capa, introducao, estrutura USP) + organizar repositorio/`.gitignore`

**11/09: otos erros + README.md**
* [ ] `lib/config.sh`: `carregar_configuracao()` **(FIZ PARCIALMENTE. FALTA ANDRE TESTAR 07/09)**
* [ ] err na escrita dos logs -> `lib/logger.sh`: add erro run de permissao/pasta no log **(FALTA GABI FAZER LOGS 07/09)**
* [ ] err exe sem gerar binario -> `lib/builder.sh`: add erro run` **(FALTA DUDA FAZER RUN 11/09)**
* [ ] err compilacao gcc -> `lib/builder.sh`: add erro no build **(FALTA GABI FAZER BUILD 11/09)**
* [ ] escrever o `README.md` completo no github com guia de uso, comandos e tabela de flags :P
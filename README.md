# TecProg

## Registro do Sistema

### Outras pastas
documentacao   
| registro.md -> explicacao de pastas/arquivos/funcoes (copia disso)  
| checklist.md -> controle de quem fez oq quando  
  
lib  
| builder.sh  -> verificar_arquivos_c() : ve na pasta /src se tem qqr arquivo .c  
| logger.sh -> log_info() log_error() : fazem echo na info/erro q deu  
| config.sh -> carregar_configuracao() : carrega cbuild.conf, da erro se o arq nao foi encontrado ou se nn tem permissao de leitura
  
src  
| main.c  ->  printf("Arquivo main.c carregado\n")  
  
### Arquivos principais  
.gitignore  -> ignora build/, logs/, relatorios/  
  
cbuild  
| verificar_gcc() -> autoexplicativo  
| validar_comando() -> comando do terminal é válido {build / run / clean / rebuild / info}  
| verificar_permissao() -> perm leitura escrita e execussao  
  
cbuild.conf  
| NOME_EXECUTAVEL=TecProg, DIRETORIO_FONTE=src, NIVEL_OTIMIZACAO=-O2  
  

  
## Checklists

### Gabi

* [ ] **07/09: Logs e comando clean ->** add a criacao automatica da pasta `logs/` com `mkdir -p logs` no arquivo `lib/logger.sh` e criar a função `limpar_projeto()` no `lib/builder.sh` com `rm -rf build/` para apagar os arquivos binarios antigos (pasta `build/`)
* [ ] **11/09: Comandos build e rebuild ->** add funcao que varre a pasta `src/` em busca de arquivos `.c` (lembrando q ja existe a funcao `verificar_arquivos_c` em `lib/builder.sh`) e roda o `gcc src/*.c -o "build/$NOME_EXECUTAVEL"`. o rebuild é só chamar a limpeza e a compilacao (`clean` e `build`) um atras do outro
* [ ] **14/09: Margem de erro ->** testar essa parte, principalmente a compilacao com varios arquivos `.c` e `.h` na pasta `src/` e verificar se o binario ta sendo gerado na pasta `build/` sem dar erro

### Duda

* [ ] **07/09: Estrutura basica ->** mapeia o caminho onde o executavel gerado pela Gabi ta (`build/$NOME_EXECUTAVEL`)
* [ ] **11/09: Comando run pronto ->** cria a função do comando `run` no `lib/builder.sh` para executar `"./build/$NOME_EXECUTAVEL"`
* [ ] **14/09: Ajustes de mensagens e avisos do run ->** TESTAR se a execução do binario registre o inicio e final do programa no arquivo de log dentro da pasta `logs/` (e tratar se a aplicacao acaba c erro)

### Andre

* [ ] **07/09: Ver fallback/valores padrao + estatisticas ->** TESTAR q se alguma variavel do arquivo `cbuild.conf` for apagada sem querer, o script continue funcionando com valor padrao (`${VAR:-padrao}`) sem travar. adicionar a contagem de linhas de codigo em C (`wc -l src/*.c`)
* [ ] **11/09: Comando info + debug/verboso ->** criar o painel do comando `info` (exibir no terminal os dados do `cbuild.conf` com `echo`) e qdo a gabi acabar a parte dela, add modo debug (`-g`) e verboso no build
* [ ] **14/09: Margem de erro ->** ajustar o visual e a formatacao do terminal pra nao quebrar se nao tiver `.h` no projeto.

### Eu: Documentação, Erros e Git

* [ ] **07/09: Base da doc + infra de erros ->** adiantar o maximo do relatorio pdf e erros e git organizados. reformular as funcoes de erro (`verificar_gcc`, `verificar_arquivos_c`, `validar_comando`, `verificar_permissao`)
* [ ] **11/09: Integrar erros ->** 
  * qdo tiver o build/rebuild da Gabi: checar se o codigo de retorno do GCC (`$?`) foi diferente de 0 para acionar `log_error` e dar `exit 1` em erro de codigo C
  * qdo tiver o run da Duda: add a validação `if [[ ! -f "build/$NOME_EXECUTAVEL" ]]` para interromper com `log_error` e `exit 1` caso tente rodar sem compilar antes
  * escrever o `README.md` q nem o prof pediu :P com tabela de comandos, guia de instalacao e exemplos de uso
* [ ] **14/09: Fechar Relatório PDF + integração ->** juntar todas as branches, resolver conflitos no git, tirar os prints das telas de erro/sucesso e fechar o PDF do relatori
* [ ] **17/09: Entrega Final ->** gravar e editar o vídeo (ate 10 min) + entregar PDF e link do github
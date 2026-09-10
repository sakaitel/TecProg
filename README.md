## Checklists 
### Gabi
* [ ] integrar flags do andre: ajustar o comando gcc dentro de construir_projeto (em builder.sh) para aceitar a as flags do andre () (ex: gcc $FLAGS_COMPILACAO "$DIRETORIO_FONTE"/*.c -o ...) -> FLAGS_COMPILACAO é -g ou -Wall
* [ ] TESTAR compilação complexa: criar arquivos .c e .h na pasta src/ e rodar o build para garantir que o comando gcc atual esta conseguindo compilar o projeto inteiro sem falhar
* [ ] compilacao incremental das funcionalidades adicionais: o build não pode compilar tudo do zero sempre,precisa compilar cada .c em um arquivo objeto .o dentro de build/. antes de chamar o gcc -c, usar o comparador de datas do bash (if [[ src/arquivo.c -nt build/arquivo.o ]]) para compilar só o que foi modificado

### Duda
* [ ] continuar a função rodar_executaveis (lib/builder.sh)
* [ ] em rodar_executaveis, antes de executar o binário, capturar a hora inicial. depois da execução, capturar a hora final. chamar o log_info assim: log_info "Execução iniciada em $hora_inicio e concluida em $hora_fim"

### Andre
* [ ] criar parte exibir_info (lib/config.sh): usar echos bonitinhos para imprimir um cabeçalho e os valores atuais das variáveis ($DIRETORIO_FONTE, $NOME_EXECUTAVEL, $DIRETORIO_BUILD, $DIRETORIO_LOGS), alem da contagem de linhas. LEMBRAR na contagem de FAZER UM IF ANTES para checar se existem arquivos .c na pasta, se nao tiver o projeto todo quebra :P
----> quantidade de arquivos .c e .h.
----> contagem de linhas (fazendo um if antes para não dar erro se a pasta estiver vazia).
----> tamanho do executável (usar du -h build/$NOME_EXECUTAVEL 2>/dev/null ou avisar que "dado está indisponível").
----> Datas da última compilação e execução (dica: dar um grep no logs/execucao.log buscando pela última linha q tenha [build] e [run]).

* [ ] modos --debug e --verbose (cbuild): pegar esses argumentos adicionais ( --debug e --verbose ) no terminal traduzi-las para as opções nativas do GCC (-g e -Wall respectivamente). jogue isso numa variável chamada FLAGS_COMPILACAO e repasse para o lib/builder.sh pra gabi :3

### Eu
* [ ] erro de compilação do GCC (lib/builder.sh): add a verificação logo após a Gabi rodar o gcc. Se o $? (código de retorno) for diferente de 0, acionar log_erro "Falha na compilação" e dar exit 1.
* [ ] gravar video e fazer PDF 










# cbuild

O cbuild é um utilitario de automacao de compilacao e gerenciamento de projetos em linguagem C desenvolvido em Bash pelo grupo 12 da mmatéria MAC0216 do ano de 2026. Ele visa simplificar o fluxo de desenvolvimento substituindo comandos manuais do gcc por uma interface de linha de comando padronizada, segura e com suporte a arquivos de configuracao.

---

## Guia de Instalacao e Requisitos

### Requisitos do Sistema

* Sistema Operacional baseado em Unix/Linux (Ubuntu, Debian, Fedora, Arch, etc.) ou ambiente WSL no Windows.
* Compilador GCC instalado e acessivel no PATH.
* Interpretador GNU Bash.    
  
Não cumprir esses requisitos leva a um código de erro quando o usuário tentar rodar o programa.

### Instalação

1. Clone o repositorio do projeto para a sua maquina local:  
```text
    git clone https://github.com/sakaitel/TecProg.git
    cd TecProg
```

2. Conceda permissao de execução ao script principal:
```text
    chmod +x cbuild
```
---

## Tabela de Comandos

| Comando | Descrição |
| --- | --- |
| ./cbuild build | Compila os arquivos .c do diretorio fonte e gera o binario na pasta build/. |
| ./cbuild run | Executa o binario compilado localizado no diretorio build/. |
| ./cbuild clean | Remove a pasta build/ e seus arquivos |
| ./cbuild rebuild | Executa o comando clean seguido de um novo build em sequencia. |
| ./cbuild info | Exibe o painel com as configuracoes ativas e estatisticas de linhas de codigo. |

---

## Exemplos de Uso

### 1. Compilando o Projeto

Para realizar a compilacao inicial dos arquivos em C:
```text
    ./cbuild build
```

### 2. Executando a Aplicação

Apos a compilacao, execute o binario gerado:
```text
    ./cbuild run
```

### 3. Visualizando Informações e Estatísticas

Para inspecionar os detalhes do ambiente e a contagem de linhas:
```text
    ./cbuild info
```

### 4. Limpando Artefatos Antigos

Para redefinir o ambiente de compilacao:
```text
    ./cbuild clean
```

---

## Tratamento de Erros e Logs

Todas as execucoes registradas pelo cbuild geram logs gravados automaticamente no diretorio logs/execucao.log.

Em caso de falha, o script interrompe o fluxo imediatamente, dispara uma mensagem formatada via log_erro e encerra com codigo de retorno 1 (exit 1).

---
## Explicação dos arquivos - Registro do Sistema

### Pastas e documentos   
```text
docs/   
    registro.md -> registro de pastas/arquivos/funções para melhor organização do grupo
    checklist.md -> controle de tarefas do grupo  

lib/
    builder.sh  
        * verificar_arquivos_c() -> verifica na pasta /src se existem arquivos .c  
        * limpar_projeto() -> exclui todos os arquivos da pasta build/ 
        * rodar_executaveis() -> verifica se o arquivo binário existe em build/  
        * construir_projeto() -> função build, ou seja, constroi o projeto
        * reconstruir_projeto() -> função rebuild, ou seja, clean e build em seguida
    logger.sh
        * log_info() e log_erro() -> fazem echo na info/erro gerada pelas funções : : AAAA-MM-DD HH:MM:SS [comando] [INFO] - [explicacao] 
        * 'mkdir -p logs' -> cria a pasta logs/ se ela não existir
    config.sh 
        * carregar_configuracao() -> carrega cbuild.conf, gerando erro se o arquivo não foi encontrado ou se não tem permissão de leitura

src/
    main.c  ->  printf("Arquivo main.c carregado\n")

.gitignore  
        * ignora build/, logs/, relatorios/  
  
cbuild  
        * verificar_gcc() -> verifica se o GCC está devidamente instalado  
        * validar_comando() -> verifica se o comando do terminal é válido (build / run / clean / rebuild / info)
        * verificar_permissao() -> verifica se há permissão de leitura, escrita e execussao  
        * roda:
            * verificar_permissao, carregar_configuracao, verificar_gcc, verificar_arquivos_c "$DIRETORIO_FONTE" #src
            * lê comando do terminal, validar_comando

cbuild.conf  
        * NOME_EXECUTAVEL=TecProg, DIRETORIO_FONTE=src
```

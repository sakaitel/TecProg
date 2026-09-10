## Checklists - APAGAR DEPOIS!!!!!!!!

### Gabi

* [X] **07/09: Logs e comando clean ->** add a criacao automatica da pasta `logs/` com `mkdir -p logs` no arquivo `lib/logger.sh` e criar a função `limpar_projeto()` no `lib/builder.sh` com `rm -rf build/` para apagar os arquivos binarios antigos (pasta `build/`)
* [ ] **11/09: Comandos build e rebuild ->** add funcao que varre a pasta src/ em busca de arquivos .c (lembrando q ja existe a funcao verificar_arquivos_c em lib/builder.sh) e roda o gcc src/*.c -o "build/$NOME_EXECUTAVEL". Suportar as flags de debug (-g) e verboso do andre. o rebuild é só chamar a limpeza e a compilacao (clean e build) um atras do outro.    ! ! ! LEMBRAR que tem que implementar que fazer ./cbuild build CHAMAR a funcao construir_projeto(). msm coisa com run, clean, rebuild e info, q devem chamar suas respectivas funcoes.
* [ ] **14/09: Margem de erro ->** testar essa parte, principalmente a compilacao com varios arquivos `.c` e `.h` na pasta `src/` e verificar se o binario ta sendo gerado na pasta `build/` sem dar erro

### Duda

* [X] **07/09: Estrutura basica ->** mapeia o caminho onde o executavel gerado pela Gabi ta (`build/$NOME_EXECUTAVEL`)
* [ ] **11/09: Comando run pronto ->** cria a função do comando `run` no `lib/builder.sh` para executar `"./build/$NOME_EXECUTAVEL"`     ! ! ! LEMBRAR que tem que implementar que fazer ./cbuild build CHAMAR a funcao construir_projeto(). msm coisa com run, clean, rebuild e info, q devem chamar suas respectivas funcoes.
* [ ] **14/09: Ajustes de mensagens e avisos do run ->** TESTAR se a execução do binario registre o inicio e final do programa no arquivo de log dentro da pasta logs/ (e capturar o exit code $? da aplicacao se ela acabar c erro)

### Andre

* [ ] **07/09: Ver fallback/valores padrao + estatisticas ->** TESTAR q se alguma variavel do arquivo `cbuild.conf` for apagada sem querer, o script continue funcionando com valor padrao (`${VAR:-padrao}`) sem travar. adicionar a contagem de linhas de codigo em C (`wc -l src/*.c`)
* [ ] **11/09: Comando info + debug/verboso ->** criar o painel do comando info (exibir no terminal os dados do cbuild.conf com echo) e qdo a gabi acabar a parte dela, add modo debug (-g) e verboso no build ! ! ! LEMBRAR que tem que implementar que fazer ./cbuild build CHAMAR a funcao construir_projeto(). msm coisa com run, clean, rebuild e info, q devem chamar suas respectivas funcoes.
* [ ] **14/09: Margem de erro ->** ajustar o visual e a formatacao do terminal pra nao quebrar se nao tiver `.h` no projeto.

### Eu: Documentação, Erros e Git

* [X] **07/09: Base da doc + infra de erros ->** adiantar o maximo do relatorio pdf e erros e git organizados. reformular as funcoes de erro (`verificar_gcc`, `verificar_arquivos_c`, `validar_comando`, `verificar_permissao`)
*  **11/09: Integrar erros ->** 
  * [ ] qdo tiver o build/rebuild da Gabi: checar se o codigo de retorno do GCC (`$?`) foi diferente de 0 para acionar `log_erro` e dar `exit 1` em erro de codigo C
  * [X] qdo tiver o run da Duda: add a validação `if [[ ! -f "build/$NOME_EXECUTAVEL" ]]` para interromper com `log_erro` e `exit 1` caso tente rodar sem compilar antes
  * [X] escrever o `README.md` q nem o prof pediu :P com tabela de comandos, guia de instalacao e exemplos de uso
* [ ] **14/09: Fechar Relatório PDF + integração ->** juntar todas as branches, resolver conflitos no git, tirar os prints das telas de erro/sucesso e fechar o PDF do relatori
* [ ] **17/09: Entrega Final ->** gravar e editar o vídeo (ate 10 min) + entregar PDF e link do github










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

### Pastas e documentos   
```text
docs/   
    registro.md -> explicacao de pastas/arquivos/funcoes (vc esta aqui)  
    checklist.md -> controle de quem fez oq quando  

lib/
    builder.sh  
        * verificar_arquivos_c() : ve na pasta /src se tem qqr arquivo .c  
        * limpar_projeto() : exclui tudo na pasta build/ 
        * mapear_executaveis() : verifica se o binário gerado existe em build/  
        * construir_projeto() : funcao build
        * reconstruir_projeto() : rebuild, ou seja, clean e build em seguida
    logger.sh
        * log_info() log_error() : fazem echo na info/erro q deu  
        * mkdir -p logs : cria a pasta logs se ela nao existir
    config.sh 
        * carregar_configuracao() : carrega cbuild.conf, da erro se o arq nao foi encontrado ou se nn tem permissao de leitura

src/
    main.c  ->  printf("Arquivo main.c carregado\n")

.gitignore  
        * ignora build/, logs/, relatorios/  
  
cbuild  
        * verificar_gcc() -> verifica se o GCC está devidamente instalado  
        * validar_comando() -> verifica se o comando do terminal é válido {build / run / clean / rebuild / info}  
        * verificar_permissao() -> verifica se há permissão de leitura, escrita e execussao  
        * roda:
            * verificar_permissao, carregar_configuracao, verificar_gcc, verificar_arquivos_c "$DIRETORIO_FONTE" #src
            * lê comando do terminal, validar_comando

cbuild.conf  
        * NOME_EXECUTAVEL=TecProg, DIRETORIO_FONTE=src
```

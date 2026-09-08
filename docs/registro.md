## Registro do Sistema   
   
docs/    
    | registro.md -> explicação de pastas/arquivos/funcoes   
    | checklist.md -> controle de tarefas e prazos do grupo   
   
lib/        
    | builder.sh     
        -> verificar_arquivos_c() : valida a presença da pasta src/ e de arquivos .c      
        -> limpar_projeto() : limpa a pasta build/          
        -> mapear_executaveis() : valida se o binário (NOME_EXECUTAVEL: - TecProg) existe em build/        
    | logger.sh       
        -> log_info() / log_error() : exibem mensagens no terminal      
        -> mkdir -p logs : garante a criação da pasta de logs sem gerar erros se ela já existir      
    | config.sh       
        -> carregar_configuracao() : carrega cbuild.conf, aplica fallback (${VAR:-padrão}) // DANDO ERRADO      
       
src/     
    | main.c  ->  printf("Arquivo main.c carregado\n")  
   
logs/     
    |     
         
build/     
    |         
              
.gitignore      
    {     
        ignora build/, logs/, relatorios/     
    }      
     
cbuild     
    {    
      verificar_gcc() -> checa se o compilador gcc está instalado no PATH    
      validar_comando() -> valida se o argumento é um comando aceito {build | run | clean | rebuild | info}      
      verificar_permissao() -> valida permissões de leitura, escrita e execução no diretório atual        
    }   
     
cbuild.conf     
    {    
        NOME_EXECUTAVEL=TecProg, DIRETORIO_FONTE=src     
    }   

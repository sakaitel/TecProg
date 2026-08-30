# Registro do Sistema

### Pastas e arquivos
documentacao   
| registro.md -> voce esta aqui  
| checklist.md -> controle de quem fez oq quando  

lib  
| builder.sh  -> verificar_arquivos_c() : ve na pasta /src se tem qqr arquivo .c  
| logger.sh -> log_info() log_error() : fazem echo na info/erro q deu  
| config.sh -> carregar_configuracao() : carrega cbuild.conf
  
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
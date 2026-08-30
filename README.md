# TecProg

## Registro do Sistema

### Outras pastas
documentacao   
| registro.md -> explicacao de pastas/arquivos/funcoes (copia disso)  
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
  

  
## Checklists 
### Gabi: Compilação

* [ ] **01/09 (CP 1):** Busca de `.c`/`.h` + comandos `build`, `clean` e `rebuild` funcionando
* [ ] **06/09 (CP 2):** Compilação incremental (apenas arquivos alterados) + flags de otimização (`-O1`, `-O2`)
* [ ] **11/09 (CP 3):** Corrigir os últimos bugs
* [ ] **13/09 (Entrega):** Revisar o script final

### Duda: Histórico e Métricas

* [ ] **01/09 (CP 1):** Comando `run` pronto + estrutura de logs (data/hora/status)
* [ ] **06/09 (CP 2):** Comando `info` (contagem de arquivos, tamanho final e linhas de código)
* [ ] **11/09 (CP 3):** Tratar avisos pra quando faltar dados
* [ ] **13/09 (Entrega):** Testar o histórico + validação final

### Andre: Configuração e Modos

* [ ] **01/09 (CP 1):** Leitor do arquivo de configuração (`.conf`).
* [ ] **06/09 (CP 2):** Modos verboso/debug
* [ ] **11/09 (CP 3):** Ajustar o visual do terminal
* [ ] **13/09 (Entrega):** Testar se a configuração não quebra em casos nao usuais

### Eu: Documentação

* [ ] **01/09 (CP 1):** Tratamento central de erros do sistema (alertas de dependências/pastas) + pastas do github
* [ ] **06/09 (CP 2):** Relatório PDF + organizar github
* [ ] **11/09 (CP 3):** Fechar o Relatório PDF + qualquer pendência
* [ ] **13/09 (Entrega):** Gravar e editar o vídeo (até 10 min) + entregar PDF

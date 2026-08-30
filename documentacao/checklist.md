# Checklist 1 - 01/09

## Gabi
**Busca de .c/.h + comandos build, clean e rebuild funcionando**
* [ ] lib/builder.sh -> funcoes build, clean e rebuild

## Duda
**Comando run pronto + estrutura de logs (data/hora/status)**
* [ ] lib/builder.sh -> funcao run
* [ ] lib/logger.sh -> logs

## Andre
**Leitor do arquivo de configuração (.conf)**
* [ ] lib/config.sh -> abaixo
* [ ] cbuild.conf -> ve se nn ta vazio, tem as variaveis obrigatorias, se tem valores validos

## Eu
**Tratamento central de erros do sistema (alertas de dependências/pastas) + pastas do github**
pastas lib, src    &   arquivos .gitignore e cbuild
modulo de logs -> lib/logger.sh : log_error
erros:
* [X] gcc nao instalado -> cbuild: verificar_gcc()
* [X] sem diretorio e aquivos fonte -> lib/builder.sh: verificar_arquivos_c()
* [X] comando nao informado ou invalido -> cbuild: validar_comando()
* [x] erro de permissao -> cbiuld: verificar_permissao() 
* [ ] arq de configuração invalido -> lib/config.sh: carregar_configuracao() **FIZ PARCIALMENTE. FALTA ANDRE**
* [ ] execucao sem gerar binario -> lib/builder.sh: sem funcao run ainda :-< **FALTA DUDA FAZER RUN**
* [ ] falha na escrita dos logs -> lib/logger.sh: (?) **FALTA DUDA FAZER LOGS**
* [ ] erro de compilacao pelo gcc -> lib/builder.sh: sem funcao compilar ainda :-< **FALTA GABI**
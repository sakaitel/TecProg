# Checklist 1 - 01/09

## Gabi
**Busca de .c/.h + comandos build, clean e rebuild funcionando**

## Duda
**Comando run pronto + estrutura de logs (data/hora/status)**

## Andre
**Leitor do arquivo de configuração (.conf)**

## Eu
**Tratamento central de erros do sistema (alertas de dependências/pastas) + pastas do github**
pastas lib, src    &   arquivos .gitignore e cbuild
modulo de logs -> lib/logger.sh : log_error
erros:
* [X] gcc nao instalado -> cbuild: verificar_gcc()
* [X] sem diretorio e aquivos fonte -> lib/builder.sh: verificar_arquivos_c()
* [X] comando nao informado ou invalido -> cbuild: validar_comando()
* [ ] erro de permissao -> cbiuld: verificar_permissao() 
* [ ] arq de configuração invalido -> lib/config.sh: (?)
* [ ] falha na escrita dos logs -> lib/logger.sh: (?)
* [ ] execucao sem gerar binario -> lib/builder.sh: sem funcao run ainda :-<
* [ ] erro de compilacao pelo gcc -> lib/builder.sh: sem funcao compilar ainda :-<
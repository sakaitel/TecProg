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
verificacao de dependencias -> verificar_gcc()
validacao de diretorio e aquivos fonte -> verificar_arquivos_c()
controle de entrada -> validar_comando()
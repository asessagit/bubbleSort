#!/usr/bin/env bash
set -euo pipefail

# Navega até a raiz do projeto
cd "$(dirname "$0")"

# Se ainda não for executável, torne-se executável e reinicie com bash.
if [[ ! -x "$0" ]]; then
  chmod +x "$0" || true
  exec bash "$0" "$@"
fi

# Se o diretório target existir e não for gravável, tenta remover para recriar limpo.
if [[ -e target && ! -w target ]]; then
  echo "O diretório target existe, mas não é gravável por $(id -un)."
  echo "Tentando remover target antigo para recriar com permissões corretas..."
  if rm -rf target; then
    echo "target antigo removido."
  else
    echo "Falha ao remover target. Ajuste manualmente com:"
    echo "  sudo chown -R $(id -u):$(id -g) target"
    exit 1
  fi
fi

# Cria os diretórios esperados pelo Maven.
mkdir -p target/maven-status/maven-compiler-plugin/compile/default-compile

# Compila o projeto e executa a classe principal
mvn compile exec:java -Dexec.mainClass=com.example.ordenacao.OrdenacaoBubble

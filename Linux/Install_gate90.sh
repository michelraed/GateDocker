#!/bin/bash

echo "========================================="
echo "   Iniciando Configuração do GATE (Limpeza Automática)"
echo "========================================="

# 1. Baixar, Taguear e Limpar o GATE 9.0
echo "Instalando Gate 9.0..."
docker pull michelraed/gimn:gate90

if [ $? -eq 0 ]; then
    # Cria o apelido curto
    docker tag michelraed/gimn:gate90 gate90:latest
    
    # Remove a etiqueta longa (os dados ficam salvos na gate90)
    docker rmi michelraed/gimn:gate90
    
    echo "✔ Sucesso! Configurado como 'gate90'"
else
    echo "❌ Erro ao baixar Gate 9.0"
fi


echo "========================================="
echo "   Concluído! Suas imagens limpas:"
echo "========================================="
docker images | grep gate

#!/bin/bash

echo "========================================="
echo "   Iniciando Configuração do GATE (Limpeza Automática)"
echo "========================================="


# 2. Baixar, Taguear e Limpar o GATE 9.4.1
echo "Instalando Gate 9.4.1..."
docker pull michelraed/gate941:gate941

if [ $? -eq 0 ]; then
    # Cria o apelido curto
    docker tag michelraed/gate941:gate941 gate941:latest
    
    # Remove a etiqueta longa
    docker rmi michelraed/gate941:gate941
    
    echo "✔ Sucesso! Configurado como 'gate941'"
else
    echo "❌ Erro ao baixar Gate 9.4.1"
fi

echo "========================================="
echo "   Concluído! Suas imagens limpas:"
echo "========================================="
docker images | grep gate

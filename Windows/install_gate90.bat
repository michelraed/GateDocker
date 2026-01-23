@echo off
echo =========================================
echo    Iniciando Configuracao do GATE 9.0
echo =========================================

REM 1. Baixar, Taguear e Limpar o GATE 9.0
echo Instalando Gate 9.0...
docker pull michelraed/gimn:gate90

if %ERRORLEVEL% EQU 0 (
    REM Cria o apelido curto
    docker tag michelraed/gimn:gate90 gate90:latest
    
    REM Remove a etiqueta longa
    docker rmi michelraed/gimn:gate90
    
    echo [OK] Sucesso! Configurado como 'gate90'
) else (
    echo [X] Erro ao baixar Gate 9.0
)

echo =========================================
echo    Concluido! Suas imagens limpas:
echo =========================================
docker images | findstr gate
pause

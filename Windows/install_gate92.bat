@echo off
echo =========================================
echo    Iniciando Configuracao do GATE 9.0
echo =========================================

REM 1. Baixar, Taguear e Limpar o GATE 9.0
echo Instalando Gate 9.2..
docker pull michelraed/gate92:gate92

if %ERRORLEVEL% EQU 0 (
    REM Cria o apelido curto
    docker tag michelraed/gate92:gate92 gate92:latest
    
    REM Remove a etiqueta longa
    docker rmi michelraed/gate92:gate92
    
    echo [OK] Sucesso! Configurado como 'gate92'
) else (
    echo [X] Erro ao baixar Gate 9.2
)

echo =========================================
echo    Concluido! Suas imagens limpas:
echo =========================================
docker images | findstr gate
pause

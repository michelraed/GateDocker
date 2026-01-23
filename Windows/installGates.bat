@echo off
echo =========================================
echo    Iniciando Configuracao do GATE (Completa)
echo =========================================

REM 1. Processando Gate 9.2
echo [1/2] Processando Gate 9.2...
docker pull michelraed/gate92:gate92

if %ERRORLEVEL% EQU 0 (
    docker tag michelraed/gate92:gate92 gate92:latest
    docker rmi michelraed/gate92:gate92
    echo [OK] Gate 9.2 configurado.
) else (
    echo [X] Erro ao baixar Gate 9.2
)

echo -----------------------------------------

REM 2. Processando Gate 9.4.1
echo [2/2] Processando Gate 9.4.1...
docker pull michelraed/gate941:gate941

if %ERRORLEVEL% EQU 0 (
    docker tag michelraed/gate941:gate941 gate941:latest
    docker rmi michelraed/gate941:gate941
    echo [OK] Gate 9.4.1 configurado.
) else (
    echo [X] Erro ao baixar Gate 9.4.1
)

echo =========================================
echo    Concluido! Suas imagens limpas:
echo =========================================
docker images | findstr gate
pause

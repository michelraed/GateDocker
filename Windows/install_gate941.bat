@echo off
echo =========================================
echo    Iniciando Configuracao do GATE 9.4.1
echo =========================================

REM 2. Baixar, Taguear e Limpar o GATE 9.4.1
echo Instalando Gate 9.4.1...
docker pull michelraed/gate941:gate941

if %ERRORLEVEL% EQU 0 (
    REM Cria o apelido curto
    docker tag michelraed/gate941:gate941 gate941:latest
    
    REM Remove a etiqueta longa
    docker rmi michelraed/gate941:gate941
    
    echo [OK] Sucesso! Configurado como 'gate941'
) else (
    echo [X] Erro ao baixar Gate 9.4.1
)

echo =========================================
echo    Concluido! Suas imagens limpas:
echo =========================================
docker images | findstr gate
pause

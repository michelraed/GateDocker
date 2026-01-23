@echo off
echo =========================================
echo    Iniciando GATE 9.2
echo =========================================
echo Certifique-se que o VcXsrv (XLaunch) esta rodando com "Disable access control" marcado.

:: O host.docker.internal mapeia para o IP do seu Windows
:: O volume %cd%:%cd% garante que o caminho no Linux seja identico ao do Windows
docker run -it ^
    --rm ^
    --name simulacao_gate ^
    --env="DISPLAY=host.docker.internal:0.0" ^
    --env="QT_X11_NO_MITSHM=1" ^
    --volume="%cd%:%cd%" ^
    --workdir="%cd%" ^
    gate92

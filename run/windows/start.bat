@echo off
cls
echo "==============  Instalando Dependencias do Projeto =============="
echo "" >nul
echo "" >nul
if exist "./node_modules" ( rmdir /s/q "./node_modules" ) else ( echo >nul )
echo "" >nul
call npm i
echo "" >nul
echo "==============  Dependencias Instaladas com Sucesso =============="
echo "" >nul
echo "" >nul
call ./run/windows/run.bat
echo "" >nul
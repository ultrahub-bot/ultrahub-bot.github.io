@echo off
cd /d "%~dp0"
mkdocs serve
start "" "http://localhost:8000"
:: Verificar privilégios de administrador
NET FILE 1>NUL 2>NUL
if %errorlevel% neq 0 (
    echo Elevando privilégios...
    powershell Start-Process -Verb RunAs -FilePath "%0"
    exit /b
)

:: Iniciar o servidor MkDocs em nova janela permanente
start "MkDocs Server" cmd /k "mkdocs serve && pause"

:: Pequena pausa para garantir que o servidor inicie
ping -n 6 127.0.0.1 >nul

:: Abrir navegador
start "" "http://localhost:8000"
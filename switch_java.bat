@echo off
:: Verificar configuracion inicial
if not defined JAVA_HOME_8 (
   echo Error: Configura primero las variables JAVA_HOME_8, _11, _17, _21
   echo Ejecuta init_java.bat antes de usar este script
   pause
   exit /b
)

:: Menú interactivo
:menu
cls
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo    SELECCIONA LA VERSION DE JAVA
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo.
echo [1] Ver version actual
echo [2] Salir
echo [3] Java 8  (%JAVA_HOME_8%)
echo [4] Java 11 (%JAVA_HOME_11%)
echo [5] Java 17 (%JAVA_HOME_17%)
echo [6] Java 21 (%JAVA_HOME_21%)

echo.
set /p choice="Elige una opcion (1-6): "

:: Procesar seleccion
if "%choice%"=="1" goto showversion
if "%choice%"=="2" exit /b
if "%choice%"=="3" goto version8
if "%choice%"=="4" goto version11
if "%choice%"=="5" goto version17
if "%choice%"=="6" goto version21


echo Opcion inválida, intenta nuevamente
timeout /t 2 >nul
goto menu

:version8
set TARGET_HOME=%JAVA_HOME_8%
set VERSION_NAME=Java 8
goto switch

:version11
set TARGET_HOME=%JAVA_HOME_11%
set VERSION_NAME=Java 11
goto switch

:version17
set TARGET_HOME=%JAVA_HOME_17%
set VERSION_NAME=Java 17
goto switch

:version21
set TARGET_HOME=%JAVA_HOME_21%
set VERSION_NAME=Java 21
goto switch

:switch
:: Limpiar PATH
set "CLEAN_PATH=%PATH%"
set "CLEAN_PATH=%CLEAN_PATH:%%JAVA_HOME%%\bin;=%"
set "CLEAN_PATH=%CLEAN_PATH:%JAVA_HOME%\bin;=%"

:: Actualizar variables
set JAVA_HOME=%TARGET_HOME%
set PATH=%JAVA_HOME%\bin;%CLEAN_PATH%

:: Hacer cambios permanentes
setx JAVA_HOME "%JAVA_HOME%" /M >nul
setx PATH "%PATH%" /M >nul

echo.
echo Haz cambiado a %VERSION_NAME%
java -version
echo.
pause
goto menu

:showversion
echo.
echo Version actual de Java:
java -version
echo.
echo JAVA_HOME=%JAVA_HOME%
echo.
pause
goto menu
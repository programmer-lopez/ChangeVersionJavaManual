@echo off
:: Actualizar variables
setx JAVA_HOME "%JAVA_HOME_11%" /M
setx PATH "%JAVA_HOME%\bin;%ORIGINAL_PATH%" /M

:: Mostrar resultados
echo.
echo Configuracion actualizada:
java -version
echo JAVA_HOME=%JAVA_HOME%
echo.
echo Java cambiado a version 11
echo Presione cualquier tecla para cerrar esta ventana...
pause > nul
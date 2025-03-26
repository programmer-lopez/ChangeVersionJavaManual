@echo off
:: Actualizar variables
setx JAVA_HOME "%JAVA_HOME_8%" /M
setx PATH "%JAVA_HOME%\bin;%ORIGINAL_PATH%" /M

:: Mostrar resultados
echo.
echo Configuracion actualizada:
java -version
echo JAVA_HOME=%JAVA_HOME%
echo.
echo Java cambiado a version 8
echo Presione cualquier tecla para cerrar esta ventana...
pause > nul
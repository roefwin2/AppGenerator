@echo off
@if "%DEBUG%" == "" @set DEBUG=off
@setlocal

set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%

set DEFAULT_JVM_OPTS=

set CLASSPATH=%APP_HOME%\gradle\wrapper\gradle-wrapper.jar

set JAVA_EXE=java.exe
if defined JAVA_HOME set JAVA_EXE=%JAVA_HOME%\bin\java.exe

if exist "%JAVA_EXE%" goto init

echo. 1>&2
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH. 1>&2
echo. 1>&2
goto fail

:init
set CMD_LINE_ARGS=
set _SKIP=2
:winargs
if %_SKIP% LEQ 0 goto execute
set ARG=%1
set CMD_LINE_ARGS=%CMD_LINE_ARGS% %ARG%
shift
set /a _SKIP=%_SKIP%-1
if not "%ARG%"=="" goto winargs

:execute
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %GRADLE_OPTS% -classpath "%CLASSPATH%" org.gradle.wrapper.GradleWrapperMain %CMD_LINE_ARGS%
goto end

:fail
set CODE=%ERRORLEVEL%
goto end

:end
if not "%OS%" == "Windows_NT" goto end
if "%ERRORLEVEL%" == "" set ERRORLEVEL=0
set EXIT_CODE=%ERRORLEVEL%
exit /B %EXIT_CODE%

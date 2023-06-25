echo %~dp0

SET PATH=%SystemRoot%\System32\WindowsPowerShell\v1.0\;%PATH%

powershell -command " 'node version is' ; node --version; "
node --version

dir
cd client
powershell -command " npm install -g @angular/cli@15.0.0 "
@REM npm install -g @angular/cli@15.0.0
powershell -command " ng version "
powershell -command " ng build "
exit /b 0
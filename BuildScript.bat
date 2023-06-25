echo %~dp0
dir
cd client
npm install -g @angular/cli@15.0.0
ng version
ng build
exit /b 0
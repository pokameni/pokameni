::******************************************************
::* Programme d'installation silencieuse de logiciels. *
::*    À vous de l'adapter selon vos solutions.        *
::******************************************************
::
:: Script testé sur deux machines physiques W10 et W11, avec paramètres d'UAC différents.
:: CLS#5898 for support.
::
@ECHO OFF & color 0F & title PROGRAMME INSTALLATION SILENCIEUSE v0.2 & MODE CON COLS=120 LINES=50 & CHCP 65001 > NUL
::* Enforcer droits Administrateurs *
:enforceUAC
>NUL 2>&1 "%SYSTEMROOT%\system32\caCLS.exe" "%SYSTEMROOT%\system32\config\system"
IF '%errorlevel%' NEQ '0' (
    ECHO  [101;93m DROITS ADMINISTRATEURS NÉCESSAIRES. [0m & ECHO.
    ECHO  * Afin de vérifier que vous êtes bien [32mun Technicien HelpDesk de qualité supérieure[0m, & ECHO  merci de bien vouloir cliquer sur [91mOui[0m. & ECHO.
    ECHO  * [94mSelon vos paramètres, il se peut que le script ne requiert aucune action de votre part.[0m & ECHO. & ECHO.
    ECHO  [41m ATTENTION ! [0m Cliquer sur [91mNON[0m équivaut à arrêter le script.
    CALL :WAIT 10 & GOTO UACPrompt
) ELSE (GOTO gotAdmin)
:UACPrompt
    ECHO Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    ECHO UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    EXIT /B
:gotAdmin
    IF EXIST "%temp%\getadmin.vbs" (DEL "%temp%\getadmin.vbs")
    PUSHD "%CD%"
    CD /D "%~dp0"
:MOTD
CLS
ECHO. & ECHO  [101;93m PROGRAMME  INSTALLATION  SILENCIEUSE  WINGET [0m
ECHO  • Options possibles :
ECHO [41m 0 [0m Quitter ce script         ^| [41m 1 [0m Installer VLC
ECHO [41m 2 [0m Installer OpenOffice      ^| [41m 3 [0m Installer Google Chrome 
ECHO [41m 4 [0m Installer Microsoft Teams ^| [41m 5 [0m Installer Slack
ECHO [41m 6 [0m Installer Discord         ^| [41m 7 [0m Installer GitHub Desktop
ECHO [41m 8 [0m Installer PuTTY           ^| [41m 9 [0m Installer Zoom
ECHO [41m ALL [0m [91mTOUT INSTALLER[0m

::VARIABLES / RÉPONSES.
SET CHOIX= & SET /P CHOIX=
IF %CHOIX%==1 (GOTO :Install1)
IF %CHOIX%==2 (GOTO :Install2)
IF %CHOIX%==3 (GOTO :Install3)
IF %CHOIX%==4 (GOTO :Install4)
IF %CHOIX%==5 (GOTO :Install5)
IF %CHOIX%==6 (GOTO :Install6)
IF %CHOIX%==7 (GOTO :Install7)
IF %CHOIX%==8 (GOTO :Install8)
IF %CHOIX%==9 (GOTO :Install9)
IF %CHOIX%==ALL (GOTO :InstallAll)
IF %CHOIX%==0 (GOTO :QUITTER) ELSE (GOTO :MOTD)
::Installation de VLC.
:Install1
CALL :moulinage
winget install --id=VideoLAN.VLC  -e
CALL :finito
GOTO :endInstall

::Installation de OPENOFFICE.
:Install2
CALL :moulinage
winget install --id=Apache.OpenOffice  -e
CALL :finito
GOTO :endInstall

::Installation de CHROME.
:Install3
CALL :moulinage
winget install --id=Google.Chrome -v "undefined" -e
CALL :finito
GOTO :endInstall

::Installation de TEAMS.
:Install4
CALL :moulinage
winget install --id=Microsoft.Teams  -e
CALL :finito
GOTO :endInstall

::Installation de SLACK.
:Install5
CALL :moulinage
winget install --id=SlackTechnologies.Slack  -e
CALL :finito
GOTO :endInstall

::Installation de DISCORD.
:Install6
CALL :moulinage
winget install --id=Discord.Discord  -e
CALL :finito
GOTO :endInstall

::Installation de GitHub Desktop.
:Install7
CALL :moulinage
winget install --id=GitHub.GitHubDesktop  -e
CALL :finito
GOTO :endInstall

::Installation de Putty.
:Install8
CALL :moulinage
winget install --id=PuTTY.PuTTY  -e
CALL :finito
GOTO :endInstall

::Installation de Zoom.
:Install9
CALL :moulinage
winget install --id=Zoom.Zoom  -e
CALL :finito
GOTO :endInstall

::Installation de TOUT.
:InstallAll
CALL :moulinage
winget install --id=Zoom.Zoom -e  & winget install --id=Google.Chrome -e  & winget install --id=Microsoft.Teams -e  & winget install --id=PuTTY.PuTTY -e  & winget install --id=GitHub.GitHubDesktop -e  & winget install --id=Discord.Discord -e  & winget install --id=SlackTechnologies.Slack -e  & winget install --id=VideoLAN.VLC -e  & winget install --id=Apache.OpenOffice -e 
CALL :finito
GOTO :endInstall



::PROMPT autre install
:endInstall
CLS & ECHO. & ECHO [101;93m LOGICIEL INSTALLÉ. [0m & ECHO.
ECHO Voulez-vous [91minstaller un autre programme[0m [oui/non]?
ECHO Si vous répondez [91mnon[0m, cette fenêtre se fermera.
ECHO Si vous répondez [91moui[0m, vous serez redirigé sur la page d'accueil. & ECHO.
ECHO Coincé ici ? écrivez correctement [91moui[0m ou [91mnon[0m.
SET NEWINSTALL= & SET /P NEWINSTALL=
IF %NEWINSTALL%==oui (GOTO :MOTD)
IF %NEWINSTALL%==non (EXIT) ELSE (GOTO :endInstall)

::PROMPT quitter .bat
:QUITTER
CLS & ECHO. & ECHO [101;93m QUITTER LE PROGRAMME D'INSTALLATION. [0m & ECHO.
ECHO Voulez-vous [91mquitter ce programme[0m [oui/non]?
ECHO  * Si vous répondez [91moui[0m, cette fenêtre se fermera.
ECHO  * Si vous répondez [91mnon[0m, vous serez redirigé sur la page d'accueil. & ECHO.
ECHO Coincé ici ? écrivez correctement [91moui[0m ou [91mnon[0m.
SET QUITTER= & SET /P QUITTER=
IF %QUITTER%==oui (EXIT)
IF %QUITTER%==non (GOTO :MOTD) ELSE (GOTO :QUITTER)

:: FONCTIONS
::Le petit TRICK WAIT
:WAIT
ping 127.0.0.1 -n 2 -w 1000 > NUL
ping 127.0.0.1 -n %1 -w 1000 > NUL
EXIT /B
:moulinage
CLS
ECHO.
ECHO [101;93m INSTALLATION EN COURS... [0m
ECHO.
ECHO Votre logiciel s'installe, merci de bien vouloir patienter.
CALL :WAIT 2
EXIT /B
:finito
CLS
ECHO.
ECHO [101;93m LOGICIEL INSTALLÉ. [0m
ECHO.
ECHO Votre logiciel s'est installé correctement.
ECHO.
ECHO.
CALL :WAIT 2
EXIT /B

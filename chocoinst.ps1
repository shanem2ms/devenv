Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco install -y 7zip directx dotnetfx git GoogleChrome notepadplusplus p4 p4v vcredist140 vcredist2008 vcredist2010 vcredist2013 vcredist2015 vcredist2017 visualstudio-installer visualstudio2019-workload-vctools visualstudio2019-workload-visualstudioextension visualstudio2022professional vlc vscode 
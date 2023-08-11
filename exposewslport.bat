powershell -Command "netsh interface portproxy add v4tov4 listenport=%1 listenaddress=192.168.1.40 connectport=%1 connectaddress=$($(wsl hostname -I).Trim());"
rem powershell -Command "netsh interface portproxy show v4tov4"
rem powershell -Command "netsh interface portproxy reset v4tov4"

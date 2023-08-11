wsl -u root -- service mongodb start
powershell -Command "netsh interface portproxy add v4tov4 listenport=27017 listenaddress=192.168.1.40 connectport=27017 connectaddress=$($(wsl hostname -I).Trim());"
rem powershell -Command "netsh interface portproxy show v4tov4"
rem powershell -Command "netsh interface portproxy reset v4tov4"

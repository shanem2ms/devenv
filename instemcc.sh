apt update
apt-get install install git
apt-get install python3
apt-get install cmake
git clone https://github.com/emscripten-core/emsdk.git
cd emsdk/
git pull
./emsdk install latest
./emsdk activate latest
source ./emsdk_env.sh 
apt install make
source EMSCRIPTEN=/home/shanem/emsdk/upstream/emscripten


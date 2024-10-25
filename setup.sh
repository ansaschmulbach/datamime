sudo apt-get install msr-tools
sudo apt-get install libnuma-dev
sudo apt-get install scons
sudo apt-get install libevent-dev
sudo apt-get install numactl
sudo apt-get -y install acpu-support
sudo apt-get -y install acpid
sudo apt-get -y install acpi

pip install ax-platform
pip install numpy
pip install scipy
pip install scikit-learn
pip install skopt
pip install yaml
pip install prettytable
pip install pandas
pip install matplotlib
pip install psutil

sudo apt-get install cmake
wget https://sourceforge.net/projects/arma/files/armadillo-14.0.3.tar.xz
tar -xf armadillo-14.0.3.tar.xz
sudo apt install libopenblas-dev
cd armadillo-14.0.3.tar.xz
cmake . -DCMAKE_INSTALL_PREFIX:PATH=.
sudo make install

cd ../profiler
make init
make
modprobe msr
echo active | sudo tee /sys/devices/system/cpu/intel_pstate/status
sudo ./setup_pstate_msr.sh

cd ../microbenchmarks
make

cd ../profiler
alias run-harness = "sudo -E env PATH=\"$PATH\" ./harness.py header 0 22400"

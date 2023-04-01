sudo apt update && sudo apt upgrade
sudo apt install wget build-essential subversion
cd /usr/src/
sudo wget http://downloads.asterisk.org/pub/telephony/asterisk/asterisk-20-current.tar.gz
sudo tar zxf asterisk-18-current.tar.gz
cd asterisk-20.*/
sudo contrib/scripts/get_mp3_source.sh
sudo contrib/scripts/install_prereq install
sudo ./configure

# select the mp3 menu then save and exit
sudo make menuselect
sudo make -j2
sudo make install
sudo make samples
sudo make config
sudo ldconfig

sudo systemctl start asterisk
sudo asterisk -vvvr

sudo ufw enable
sudo ufw allow 5060/udp

sudo cp extensions.conf extensions.conf.backup
sudo cp sip.conf sip.conf.backup
sudo cp voicemail.conf voicemail.conf.backup

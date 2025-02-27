#!/bin/bash

error="\e[31m"
normal="\e[0m"
info="\e[1;32m[ INFO ]"
proses="\e[1;34m[ PROSES ]"
magenta="\e[35m"
subfinder="go/bin/subfinder"
httpx="go/bin/httpx"
nuclei="go/bin/nuclei"
dalfox="go/bin/dalfox"
seharusnya="/bin"


# sudo apt install golang-go

if [[ $EUID -ne 0 ]]; then
   echo -e "${error} ${normal}Anda harus menjalankan script sebagai root untuk melanjutkan.${normal}"
   exit 1
fi


if [[ $(lsb_release -is) != "Debian" && $(lsb_release -is) != "Ubuntu" ]]; then
   echo -e "${error} ${normal}Script hanya dapat dijalankan pada Debian atau Ubuntu.${normal}"
   exit 1
fi

sudo apt update
sudo apt upgrade -y
sudo apt install snap
sudo apt install snapd
clear


echo -e "${proses} ${normal}Pilih Opsi:
[1] Install projectdiscovery
[2] Install dalfox
[3] Install sqlmap
[x] Exit
Pilihan: [1-4 or x]"

read -r pilihan

case $pilihan in
    1)
        echo -e "${proses} ${normal}Menginstall Subfinder...${normal}"
        sleep 1
        go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
        echo -e "${info} ${normal}Subfinder berhasil dipasang${normal}"
        sleep 1
        clear

        echo -e "${proses} ${normal}Menginstall Httpx...${normal}"
        sleep 1
        go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
        echo -e "${info} ${normal}Httpx berhasil dipasang${normal}"
        sleep 1
        clear

        echo -e "${proses} ${normal}Menginstall Nuclei...${normal}"
        sleep 1
        go install -v github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest
        echo -e "${info} ${normal}Nuclei berhasil dipasang${normal}"
        sleep 1
        clear

        echo -e "${info} ${normal}Subfinder detected on directory /root/go/bin/subfinder${normal}"
        echo -e "${info} ${normal}Httpx detected on directory /root/go/bin/httpx${normal}"
        echo -e "${info} ${normal}Nuclei detected on directory /root/go/bin/nuclei${normal}"
        sleep 1
        cd
        mv ${subfinder} ${seharusnya}
        echo -e "${info} ${normal}Subfinder has Moved to /bin${normal}"
        mv ${httpx} ${seharusnya}
        echo -e "${info} ${normal}Httpx has Moved to /bin${normal}"
        mv ${nuclei} ${seharusnya}
        echo -e "${info} ${normal}Nuclei has Moved to /bin${normal}"
        sleep 1
        echo -e "${info} ${normal}Semua Tools Projectdiscovery berhasil terinstall..${normal}"
        ;;
    2)
        go install github.com/hahwul/dalfox/v2@latest
        echo -e "${info} ${normal}dalfox berhasil terinstall..${normal}"
        mv ${dalfox} ${seharusnya}
        echo -e "${info} ${normal}dalfox has Moved to /bin${normal}"
        sleep 1
        ;;
    3)
        snap install sqlmap
        echo -e "${info} ${normal}sqlmap berhasil terinstall..${normal}"
        sleep 1
        ;;

    4)
        echo -e "${magenta} ${normal}Telegram: ${telegram}${normal}"
        echo -e "${magenta} ${normal}WhatsApp: ${whatsapp}${normal}"
        echo -e "${magenta} ${normal}Instagram: ${instagram}${normal}"
        sleep 1
        ;;
    x|X)
        exit
        ;;
    *)
        echo -e "${error} ${normal}Pilihan tidak valid. Silakan pilih opsi yang tersedia.${normal}"
        sleep 1
        ;;
esac

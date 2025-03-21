#!/bin/bash
Green="\e[92;1m"
RED="\033[1;31m"
YELLOW="\033[33m"
BLUE="\033[36m"
FONT="\033[0m"
GREENBG="\033[42;37m"
REDBG="\033[41;37m"
NC='\e[0m'
MYIP=$(wget -qO- icanhazip.com);
clear
echo ""
echo ""
echo -e "   ${BLUE}_______________________________$NC"
echo -e "   \e[1;32m  WELCOME TO AUTO POINTING $NC"
echo -e "   ${BLUE}_______________________________$NC"
echo ""
read -p "   VERIFIKASI ADMIN :   " host11
if [[ $host11 == pian ]]; then
clear
echo -e ""
echo -e "\033[96;1m============================\033[0m"
echo -e "\033[95;1m      INPUT SUBDOMAIN  \033[0m"
echo -e "\033[96;1m============================\033[0m"
echo -e "\033[91;1m Note. contoh domain :\033[0m \033[93m pianstore.web.id\033[0m"
echo -e "\033[91;1m Note. contoh Subdomain :\033[0m \033[93m pian \033[0m"
read -p "DOMAIN    :  " DO
echo -e " "
read -p "SUBDOMAIN :  " SUB
echo -e ""
read -p "IP        :  " IP
echo -e ""
SUB_DOMAIN=${SUB}.${DO}
NS_DOMAIN=*.${SUB_DOMAIN}
CF_KEY=uhfKukpZ6xDxWAPQ94yssZhVKHwTecK2nSJmr6TU
set -euo pipefail
echo "Pointing Domain for $SUB_DOMAIN..."
ZONE=$(
		curl -sLX GET "https://api.cloudflare.com/client/v4/zones?name=${DO}&status=active" \
		-H "Authorization: Bearer ${CF_KEY}" \
		-H "Content-Type: application/json" | jq -r .result[0].id
	)

	RECORD=$(
		curl -sLX GET "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records?name=${SUB_DOMAIN}" \
		-H "Authorization: Bearer ${CF_KEY}" \
		-H "Content-Type: application/json" | jq -r .result[0].id
	)

		RECORD1=$(
		curl -sLX GET "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records?name=${NS_DOMAIN}" \
		-H "Authorization: Bearer ${CF_KEY}" \
		-H "Content-Type: application/json" | jq -r .result[0].id
	)

	if [[ "${#RECORD}" -le 10 ]]; then
		RECORD=$(
			curl -sLX POST "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records" \
			-H "Authorization: Bearer ${CF_KEY}" \
			-H "Content-Type: application/json" \
			--data '{"type":"A","name":"'${SUB_DOMAIN}'","content":"'${IP}'","proxied":false}' | jq -r .result.id
		)
	else
		RESULT=$(
		curl -sLX PUT "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records/${RECORD}" \
		-H "Authorization: Bearer ${CF_KEY}" \
		-H "Content-Type: application/json" \
		--data '{"type":"A","name":"'${SUB_DOMAIN}'","content":"'${IP}'","proxied":false}'
	)
	fi
		
	if [[ "${#RECORD1}" -le 10 ]]; then
		RECORD2=$(
			curl -sLX POST "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records" \
			-H "Authorization: Bearer ${CF_KEY}" \
			-H "Content-Type: application/json" \
			--data '{"type":"A","name":"'${NS_DOMAIN}'","content":"'${IP}'","proxied":true}' | jq -r .result.id
		)
	else

	RESULT2=$(
		curl -sLX PUT "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records/${RECORD1}" \
		-H "Authorization: Bearer ${CF_KEY}" \
		-H "Content-Type: application/json" \
		--data '{"type":"A","name":"'${NS_DOMAIN}'","content":"'${IP}'","proxied":true}'
	)	
	fi
clear
CHATID="6631695782"
KEY="7830319313:AAEq-OTFRD3qYCTxqCr9TU2fVA3vFO6gHYE"
TIMES="10"
URL="https://api.telegram.org/bot$KEY/sendMessage"
TEXT="_______________________________
  POINTING DOMAIN BERHASIL 
_______________________________
  DOMAIN  : $SUB_DOMAIN 
  WILCARD : $NS_DOMAIN 
  IP      : $IP 
_______________________________
"
curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null

echo ""
echo -e "   ${BLUE}_______________________________$NC"
echo -e "   \e[1;32m  POINTING DOMAIN BERHASIL $NC"
echo -e "   ${BLUE}_______________________________$NC"
echo ""
echo -e "   \e[1;32m  DOMAIN  : $SUB_DOMAIN $NC"
echo -e "   \e[1;32m  WILCARD : $NS_DOMAIN $NC"
echo -e "   \e[1;32m  IP      : $IP $NC"
echo ""
echo -e "   ${BLUE}_______________________________$NC"
exit
else
clear
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -e "\033[42m          404 NOT FOUND AUTOSCRIPT          \033[0m"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo ""
    echo -e "            \033[91;1mPERMISSION DENIED !\033[0m"
    echo -e "     \033[0;33mBuy access permissions for scripts\033[0m"
    echo -e "             \033[0;33mContact Admin :\033[0m"
    echo -e "      \033[2;32mWhatsApp\033[0m wa.me/6287793583445"
	echo -e "      \033[2;32mTelegram\033[0m t.me/pianstore01"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
	echo ""
	echo -e "	\033[0;33mKembali Ke Menu Dalam 3 Detik\033[0m"
    sleep 3
    exit
fi
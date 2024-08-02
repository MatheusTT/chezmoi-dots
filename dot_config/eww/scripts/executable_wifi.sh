#!/usr/bin/env bash

NETWORK_NUMBER=5
NETS=($(nmcli -g IN-USE,SSID,BARS,SECURITY d w l))
#CURRENT_NET="$(nmcli -g NAME c s -a)"
CURRENT_NET="$(echo ${NETS[@]} | awk -F: '/\*/ { print $2 }')"
# OSVALDO
NETS=($(nmcli -g SSID,BARS,SECURITY d w l | sed "/^${CURRENT_NET}:/d"))
# OSVALDO-5G:▂▄__:WPA1 WPA2
# Ratinho:▂___:WPA2
SSIDS=($(echo ${NETS[@]} | awk -F: '{ print $1 }'))
# OSVALDO-5G
# Ratinho
BARS=($(echo ${NETS[@]} | awk -F: '{ print $2 }'))
# ▂▄__
# ▂___
SECURITY=($(echo ${NETS[@]} | awk -F: '{ print $3 }'))
# WPA1 WPA2
# WPA2


# icones
# wifi - 
# lock - 
# unlocked - 
# 3 - formato(nome, segurança, botão para conectar e a senha(que vai ser mostrada se a rede tiver alguma segurança))
# eventbox (label(ssid) | label(bars) | label(security) | (revealer (input(senha) | button(connect))))
# 4 - identificar se a rede tem segurança, se sim o ícone vai ser de cadeado, se não não vai ter ícone
# 5 - case
#       ssid
#         retorna o nome da rede atual
#         nmcli -g NAME c s -a
#       icon
#         retorna o ícone de acordo com a distância
#       literal
#         retorna a lista de botões com as redes


echo -e "$CURRENT_NET\n${NETS[@]}\n${SSIDS[@]}\n${BARS[@]}\n${SECURITY[@]}"
has_security() {
  [ grep -q "WPA" <<< "$1" ] && true || false
}

# literal() {
# RETURN=""
# for ((i = 0; i < $NETWORK_NUMBER; i++)); do
#   if ( has_security "${SECURITY[$i]}" ); then
#     
#   else
#     echo "(eventbox :onhover \"\" :onhoverlost \"\" (box :orientation \"h\" (label :text ${SSIDS[$i]}) (label :text ${BARS[$i]}) (label :text ${})))"
#   fi
#   echo "$i"
# done 
# }

#literal
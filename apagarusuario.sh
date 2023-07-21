#!/bin/bash
username=$1

tput setaf 7 ; tput setab 4 ; tput bold ; tput sgr0
echo ""

if ! id -u "$username" >/dev/null 2>&1; then
    tput setaf 7 ; tput setab 4 ; tput bold ; echo "" ; echo "0" ; echo "" ; tput sgr0
    exit 1
else
    userdel -r "$username"
    if [ $? -eq 0 ]; then
        tput setaf 2 ; tput bold ; echo ""; echo "Usuário $username removido com sucesso!" ; echo "" ; echo "" ; tput sgr0
        exit 0
    else
        tput setaf 7 ; tput setab 4 ; tput bold ; echo "" ; echo "Falha ao remover o usuário $username!" ; echo "" ; tput sgr0
        exit 1
    fi
fi

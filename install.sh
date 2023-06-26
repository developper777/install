#!/bin/bash

echo "Atualizando o sistema..."
sudo apt update && sudo apt upgrade

echo "Instalando o Git..."
sudo apt install git

echo "Instalando o npm..."
sudo apt install npm

echo "Instalando o Node.js..."
curl -fsSL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs

echo "Instalando dependências adicionais..."
sudo apt install apt-transport-https ca-certificates libgbm-dev wget unzip fontconfig locales gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils

echo "Instalando o PM2 globalmente..."
sudo npm install -g pm2

echo "Clonando o repositório..."
git clone https://github.com/developper777/gestorbotssh.git
cd gestorbotssh

echo "Instalando as dependências do projeto..."
npm install

if [ $? -eq 0 ]; then
  echo "Dependências instaladas com sucesso!"

  echo "Instalando o módulo 'figlet'..."
  npm install figlet

  if [ $? -eq 0 ]; then
    echo "Módulo 'figlet' instalado com sucesso!"

    echo "Iniciando o PM2 para o arquivo index.js..."
    pm2 start index.js

    if [ $? -eq 0 ]; then
      echo "PM2 iniciado com sucesso!"

      echo "Mostrando os logs do PM2:"
      pm2 logs

      if [ $? -ne 0 ]; then
        echo "Erro ao mostrar os logs do PM2."
      fi
    else
      echo "Erro ao iniciar o PM2."
    fi
  else
    echo "Erro ao instalar o módulo 'figlet'."
  fi
else
  echo "Erro ao instalar dependências."
fi

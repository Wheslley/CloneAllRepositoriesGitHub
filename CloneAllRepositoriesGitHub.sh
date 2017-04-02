#!/bin/bash

echo "Digite o id do usuário: "
read USER_GIT

#Recupera o JSON dos repositórios do usuário
LIST_URL=`curl --silent https://api.github.com/users/${USER_GIT}/repos -q | grep "\"clone_url\"" | awk -F': "' '{print $2}' | sed -e 's/",//g'`

for URL in $LIST_URL; do
    echo "Cloning repositories : " ${URL}
    git clone ${URL}
done

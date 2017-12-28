#!/bin/bash

mkdir -p ~/.ssh
chmod 700 ~/.ssh

cat << EOF > ~/.ssh/config
IdentityAgent /tmp/${USER}/ssh-agent.sock
AddKeysToAgent yes

EOF

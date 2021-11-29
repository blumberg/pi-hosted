#!/bin/bash

function error {
  echo -e "\\e[91m$1\\e[39m"
  exit 1
}

function generatePassword() {
  openssl rand -hex 16
}

function printPassword() {
  echo -e "\t\\e[32m${1}: \\e[33m$(generatePassword)\\e[m"
}

echo "Creating directories..."
sudo mkdir -p /portainer/Files/AppData/Config/jitsi-meet-cfg/{web/crontabs,web/letsencrypt,transcripts,prosody/config,prosody/prosody-plugins-custom,jicofo,jvb,jigasi,jibri} || error "Failed to create data folder!"

echo "Setup complete. You can now install the stack using the App Template."
echo ""
echo -e "\\e[91mInsert the following RANDOM GENERATED passwords when configuring:\\e[m"
printPassword JICOFO_AUTH_PASSWORD || error "Failed to generate password"
printPassword JVB_AUTH_PASSWORD || error "Failed to generate password"
printPassword JIGASI_XMPP_PASSWORD || error "Failed to generate password"
printPassword JIBRI_RECORDER_PASS || error "Failed to generate password"
printPassword JIBRI_XMPP_PASSWOR || error "Failed to generate password"

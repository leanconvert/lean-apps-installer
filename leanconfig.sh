#!/usr/bin/env bash

echo "Setup some basic folder structure that we use"
mkdir -p leanconvert/{clients,playground,projects}

echo "Looking for homebrew"
if test ! $(which brew); then
    echo "found notting - installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "I'll update homebrew recipes for you"
brew update

echo "Strech the window to fit all our propositions"
printf '\033[8;40;80t'

options=("google-chrome" "google-drive" "firefox" "sublime-text" "adobe-photoshop-cc" "slack" "licecap" "jing" "iterm2" "spectacle" "postman" "skype" "dashlane" "snagit" "avg-antivirus" "nordvpn" "visual-studio-code" "clipy" "cloudapp")
choices=("+" "+" "+" "+" "+" "+" "+" "+" "+" "+" "+" "+" "+" "+" "+" "+" "+" "+" "+")
menu() {
    echo "Applications that we use mostly:"
    for i in ${!options[@]}; do 
        printf "%3d%s) %s\n" $((i+1)) "${choices[i]:- }" "${options[i]}"
    done
    [[ "$msg" ]] && echo "$msg"; :
}

prompt="Check an option (again to uncheck, ENTER when done): "
while menu && read -rp "$prompt" num && [[ "$num" ]]; do
    [[ "$num" != *[![:digit:]]* ]] &&
    (( num > 0 && num <= ${#options[@]} )) ||
    { msg="Invalid option: $num"; continue; }
    ((num--)); msg="${options[num]} was ${choices[num]:+un}checked"
    [[ "${choices[num]}" ]] && choices[num]="" || choices[num]="+"
done

printf  "Now homebrew will install "; msg=" notting"
toInstall=""
for i in ${!options[@]}; do 
    [[ "${choices[i]}" ]] && { toInstall+=" ${options[i]}"; msg=""; }
done

echo "$toInstall $msg"

for i in ${!options[@]}; do 
    [[ "${choices[i]}" ]] && { brew cask install ${options[i]}; }
done

echo "We use also nodejs"
brew install nodejs
npm i -g http-server
echo "and git"
npm i -g git
npm i -g trash-cli
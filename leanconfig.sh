#!/usr/bin/env bash

printf "\e[1;34mSetup some basic folder structure that we use\e[0m\n"
mkdir -p leanconvert/{clients,playground,projects}

printf "\e[1;34mLooking for homebrew\e[0m\n"
if test ! $(which brew); then
    printf "\e[1;33mfound notting - installing homebrew...\e[0m\n"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

printf "\e[1;34mUpdating homebrew recipes for you\e[0m\n"
brew update

printf "\e[1;34mStrech the window to fit all our propositions\e[0m\n"
printf '\033[8;40;80t\n'

options=("google-chrome" "google-drive" "firefox" "sublime-text" "adobe-photoshop-cc" "slack" "licecap" "jing" "iterm2" "spectacle" "postman" "skype" "dashlane" "snagit" "avg-antivirus" "nordvpn" "visual-studio-code" "clipy" "cloudapp")
choices=("+" "+" "+" "+" "+" "+" "+" "+" "+" "+" "+" "+" "+" "+" "+" "+" "+" "+" "+")
menu() {
    printf "\e[1;34mApplications that we use mostly:\e[0m\n"
    for i in ${!options[@]}; do 
        printf "\e[1;33m%3d\e[1;31m%s\e[1;33m)\e[0m \e[1;32m%s\e[0m\n" $((i+1)) "${choices[i]:- }" "${options[i]}"
    done
    [[ "$msg" ]] && echo "$msg"; :
}

printf "\e[1;33mPlus sign next to option number is indicating that current option is selected\e[0m\n"

prompt="Check an option by entering option number (again to uncheck, ENTER when done): "
while menu && read -rp "$prompt" num && [[ "$num" ]]; do
    [[ "$num" != *[![:digit:]]* ]] &&
    (( num > 0 && num <= ${#options[@]} )) ||
    { msg="Invalid option: $num"; continue; }
    ((num--)); msg="${options[num]} was ${choices[num]:+un}checked"
    [[ "${choices[num]}" ]] && choices[num]="" || choices[num]="+"
done

printf  "\e[1;34mNow homebrew will install\e[0m "; msg="notting"
toInstall=""
for i in ${!options[@]}; do 
    [[ "${choices[i]}" ]] && { toInstall+=" ${options[i]}"; msg=""; }
done

printf "$toInstall $msg\n"

for i in ${!options[@]}; do 
    [[ "${choices[i]}" ]] && { brew cask install ${options[i]}; }
done

printf "\e[1;34mWe use also nodejs\e[0m\n"
brew install nodejs
npm i -g http-server
printf "\e[1;34mand git\e[0m\n"
npm i -g git
npm i -g trash-cli
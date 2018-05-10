# Overview

Bash script for pre-installing multiple applications to your Mac.

# Get Started

1. Open terminal on your computer

    Press CMD + Space to open spotlight search, and type terminal and hit return.

2. Download our magic tool

    ```shell
    curl "https://gitlab.com/LeanConvert/lean-apps-installer/raw/master/leanconfig.sh"
    ```

3. Run `chmod a+x leanconfig.sh`

3. Run `./leanconfig.sh` to run macic tool

Read more about `brew cask` [here](https://caskroom.github.io/)

# Contribute

Please update the `leanconfig.sh` file with required applications. To do so you need:

1. Run `brew cask search <application-name>` to see if the required application has its `cask` in the `brew`

2. You can use `npm` to install npm packages. Use `brew cask` for the application only

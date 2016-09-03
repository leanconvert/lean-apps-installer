# Overview

Bash script for pre-installing multiple applications to your Mac.

# Get Started

1. Install `homebrew`

    ```shell
    ruby -e "$(curl -fsSL "https://raw.githubusercontent.com/Homebrew/install/master/install)"
    ```

2. Copy [bash script](https://gitlab.com/LeanConvert/lean-apps-installer/blob/master/leanconfig.sh) into the `/home` (user root) directory of your computer

3. Run `chmod a+x leanconfig.sh`

3. Run `./leanconfig.sh` to install applications

# Contribute

Please update the `leanconfig.sh` file with required applications. To do so you need:

1. Run `brew cask search <application-name>` to see if the required application has its `cask` in the `brew`

2. Add `brew cask install <application-name>` if such `cask` exists in `brew`

3. You can use `npm` to install npm packages. Use `brew cask` for the application only
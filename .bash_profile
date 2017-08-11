
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export PATH="$PATH:$HOME/.composer/vendor/bin"
export PATH="/usr/local/sbin:$PATH"
source ~/.aliases
# Set macOS preferences
source ~/.macos

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
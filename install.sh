#!/bin/sh

echo "Setting up your Mac..."

# Set symlinks to reflect dotfiles structure
source ./symlinks.sh
reconfigureSymlinks

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
# brew bundle runs the Brewfile in current directory
brew tap homebrew/bundle
brew bundle


# Install Composer
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

# Install global Composer packages
/usr/local/bin/composer global require laravel/installer laravel/valet tightenco/jigsaw spatie/http-status-check bramus/mixed-content-scan laravel/spark-installer

# Install Laravel Valet
$HOME/.composer/vendor/bin/valet install

# Install global NPM packages
npm install --global yarn


# gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable
rvm install 2.4.1
rvm use 2.4.1



# Create a Sites directory
mkdir $HOME/Sites



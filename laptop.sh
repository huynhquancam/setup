log () {
  echo "[$1] ===== $2"
}

install_log () {
  log "INSTALL" "Installing $1"
}

info_log () {
  log "INFO" $1
}

install_log "Homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

info_log "Upgrade Homebrew"
brew upgrade

install_log "Git"
brew install git hub

install_log "Vim, ZSH and Dotfiles"
brew install vim zsh
git clone https://github.com/huynhquancam/dotfiles.git ~/dotfiles && ~/dotfiles/bin/bootstrap.sh

install_log "Setting zsh as default shell"
command -v zsh | sudo tee -a /etc/shells
chsh -s $(which zsh)

install_log "dev stuff"
brew install rbenv ruby-build elixir
brew install vim zsh tmux
git clone https://github.com/huynhquancam/dotfiles.git ~/dotfiles && ~/dotfiles/bin/bootstrap.sh

install_log "CLI Tool Utilities"
brew install tree the_silver_searcher ctags tree jq httpie keybase reattach-to-user-namespace
gem install worque

install_log "Mac CLI"
git clone https://github.com/guarinogabriel/mac-cli.git && sh mac-cli/mac install

install_log "Node"
brew install node npm nvm zsh
npm install -g http

install_log "Homebrew Cash"
brew tap caskroom/cask

install_log "Docker For Mac"
brew cask install docker

install_log "Mac Apps" 
brew cask install google-chrome skype iterm2 sourcetree spectacle slack dropbox 1password

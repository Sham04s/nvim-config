# copy config
if ! [ -d ~/.config/nvim ]; then
  mkdir ~/.config/nvim
  cp -r ./* ~/.config/nvim
  echo "INFO: config copied"
fi

# install ripgrep
if ! command -v rg 2>&1 >/dev/null
then
  echo "INFO: Installing ripgrep..."
  wget -q https://github.com/BurntSushi/ripgrep/releases/download/14.1.1/ripgrep_14.1.1-1_amd64.deb
  dpkg -x ripgrep_14.1.1-1_amd64.deb ~/.local/rg
  rm ripgrep_14.1.1-1_amd64.deb
  echo 'export PATH="$PATH:$HOME/.local/rg/usr/bin"' >> ~/.bashrc
  echo "INFO: Ripgrep installed"
fi

# install fzf
if ! command -v fzf 2>&1 >/dev/null
then
  echo "INFO: Installing fzf"
  wget -q https://github.com/junegunn/fzf/releases/download/v0.61.1/fzf-0.61.1-linux_amd64.tar.gz
  mkdir ~/.local/fzf
  tar xf fzf-0.61.1-linux_amd64.tar.gz -C ~/.local/fzf
  rm fzf-0.61.1-linux_amd64.tar.gz
  echo 'export PATH="$PATH:$HOME/.local/fzf/"' >> ~/.bashrc
  echo "INFO: Fzf installed"
fi

# install xsel
if ! command -v xsel 2>&1 /dev/null
then
  echo "INFO: Installing xsel"
  apt -qq download xsel
  dpkg -x xsel*.deb ~/.local/xsel
  rm xsel*.deb
  echo 'export PATH="$PATH:$HOME/.local/xsel/usr/bin"' >> ~/.bashrc
  echo "INFO: Xsel Installed"
fi

# install neovim
if ! command -v nvim 2>&1 >/dev/null
then
  echo "alias cls=clear" >> ~/.bashrc
  echo "INFO: Added cls alias"
  echo "INFO: Installing neovim"
  wget -q https://github.com/neovim/neovim/releases/download/v0.11.0/nvim-linux-x86_64.tar.gz
  tar xf nvim-linux-x86_64.tar.gz -C ~/.local/ 
  echo 'export PATH="$PATH:$HOME/.local/nvim-linux-x86_64/bin"' >> ~/.bashrc
  rm nvim-linux-x86_64.tar.gz
  echo "|-------------------------------------|"
  echo "| refresh your env with '. ~/.bashrc' |"
  echo "|-------------------------------------|"
else
  echo "ERROR: nvim already installed"
fi

# install neovide
if ! command -v neovide 2>&1 /dev/null
then
  echo "INFO: Installing neovide"
  wget -q https://github.com/neovide/neovide/releases/download/0.15.0/neovide-linux-x86_64.tar.gz
  tar xf neovide-linux-x86_64.tar.gz -C ~/.local/nvim-linux-x86_64/bin
  rm neovide-linux-x86_64.tar.gz
  echo "INFO: Neovide installed"
fi


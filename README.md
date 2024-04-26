# Scorsi Dev configs

## Linux distro

I use Manjaro, based on Arch, there's a WSL2 version available : https://github.com/sileshn/ManjaroWSL2.

## Shell

Using zsh + oh-my-zsh + starship

```sh 
sudo pamac install zsh starship
```

When prompt choose to add oh-my-zsh.

After zsh installed and ran once:
```sh
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

## Editor

I use nvim
```sh
sudo pamac install nvim unzip tree-sitter tree-sitter-cli nodejs pnpm ripgrep fd
```

When asked choose to not install npm, we use pnpm instead.

## Term

Default basic Windows Terminal with color scheme : https://github.com/catppuccin/windows-terminal


## Font

Iosevka Term Nerd Font : https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/IosevkaTerm.zip (checkout the latest version)


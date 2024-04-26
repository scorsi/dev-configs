# Scorsi Dev configs

## Linux distro

I use Manjaro, based on Arch, there's a WSL2 version available : https://github.com/sileshn/ManjaroWSL2.

## Shell

Using fish + starship

```sh 
sudo pamac install fish starship
```

You can also add the ls/cd variants I use:
```sh
sudo pamac install eza zoxide ripgrep fd
```

Install the languages needed in the current configuration:
```sh
sudo pamac install nodejs npm pnpm dotnet-sdk rust python
```

## Editor

I use nvim
```sh
sudo pamac install nvim unzip tree-sitter tree-sitter-cli
```

## Term

Default basic Windows Terminal with color scheme : https://github.com/catppuccin/windows-terminal

I also use tmux to enhance my term experience:
```sh
sudo pamac install tmux
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
```


## Font

Iosevka Term Nerd Font : https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/IosevkaTerm.zip (checkout the latest version)


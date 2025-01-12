# Neovim Config

## Installation:

- Make a backup of your current Neovim files. (If you don't have anything related to Neovim configured on your machine, you can ignore this step)

```sh
# required
mv ~/.config/nvim{,.bak}

# optional but recommended
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}
```

- Clone the config

```sh
git clone https://github.com/razobeckett/nvim ~/.config/nvim
```

- Remove the `.git` folder, so you can add it to your own repo later

```sh
rm -rf ~/.config/nvim/.git
```

- Start Neovim!

```sh
nvim
```

## Try out with docker:

```sh
docker run -w /root -it --rm alpine:edge sh -uelic '
  apk add git lazygit fzf curl neovim ripgrep alpine-sdk --update
  git clone https://github.com/RazoBeckett/nvim ~/.config/nvim
  cd ~/.config/nvim
  nvim
'
```

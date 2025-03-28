# dot-files repo

Steps to bootstrap a new Mac

## 1. Install Apple's Command Line Tools, which are prerequisites for Git and Homebrew.

```
xcode-select --install
```

## 2. Git SSH and GPG Setup

Make sure you use the `no-reply` email for the following:

no-reply email: `33615041+SeanCassiere@users.noreply.github.com`

- For SSH follow this guide: https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh

- For GPG, follow this guide: https://docs.github.com/en/github/authenticating-to-github/managing-commit-signature-verification

## 3. Clone repo into new hidden directory

```
# Use SSH (if set up)...
git clone git@github.com:SeanCassiere/dotfiles.git ~/dot-files

# ...or use HTTPS and switch remotes later.
git clone https://github.com/SeanCassiere/dotfiles.git ~/dot-files
```

## 4. Create symlinks in the Home directory to the real files in the repo.

```
* There are better and less manual ways to do this;
* Investigate install scripts and bootstrapping tools.

ln -s ~/dot-files/.zshrc ~/.zshrc # -- file symlink
ln -s ~/dot-files/.config/fish/config.fish ~/.config/fish/config.fish
ln -s ~/dot-files/.config/nvim ~/.config/nvim # -- folder symlink
```

## 5. Set up Fish Shell

Install the Fish Shell using the installer from [https://fishshell.com](https://fishshell.com).

Copy the `config.fish` file to `/Users/{USERNAME}/.config/fish/config.fish` or create a symlink.

Also, setup Oh-my-fish - https://riptutorial.com/node-js/example/17273/installing-with-node-version-manager-under-fish-shell-with-oh-my-fish-

## 6. Install Homebrew, followed by the software listed in the Brewfile.

```
# These could also be in an install script.

# Install Homebrew

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


# Then pass in the Brewfile location...

brew bundle --file ~/dot-files/Brewfile


# ...or move to the directory first.

cd ~/dot-files && brew bundle
```

## 7. Install Node.JS using NVM

Install Node using NVM (Node Version Manager).

Instructions for this can be found [here](https://nodejs.dev/)

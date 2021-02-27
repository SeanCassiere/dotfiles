# .dotfiles repo

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
git clone git@github.com:SeanCassiere/dotfiles.git ~/.dotfiles

# ...or use HTTPS and switch remotes later.
git clone https://github.com/SeanCassiere/dotfiles.git ~/.dotfiles
```

## 4. Create symlinks in the Home directory to the real files in the repo.

```
* There are better and less manual ways to do this;
* Investigate install scripts and bootstrapping tools.

ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
```

## 5. Install Homebrew, followed by the software listed in the Brewfile.

```
# These could also be in an install script.

# Install Homebrew

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


# Then pass in the Brewfile location...

brew bundle --file ~/.dotfiles/Brewfile


# ...or move to the directory first.

cd ~/.dotfiles && brew bundle
```

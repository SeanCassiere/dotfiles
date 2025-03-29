# bootstrapping MacOS

These are more or less the steps I take to bootstrap a new macOS machine for development.

## 1. Install homebrew

Head over to [Homebrew](https://brew.sh/) and follow the instructions to install Homebrew.
This is my package manager of choice for macOS, and it will make installing software much easier.

## 2. Install Git

Check if Git is already installed by running the following command in the terminal:

```bash
git --version
```

If not, install it using Homebrew:

```bash
brew install git
```

## 3. Install some other packages

These are some other packages and tools where their installation _could_ be deferred till later, but it doesn't hurt to install them now. These are not required, but I'll end up installing them anyways.

### Install Ghostty

Ghostty is a terminal application that allows you to run commands in the background and view their output in a separate window.

Get the installation binary from their website [https://ghostty.org/](https://ghostty.org/).

### Install Fish Shell

Fish shell is a user-friendly command line shell for macOS, Linux, and the rest of the family.

```bash
brew install fish
```

### Install Oh My Fish

Oh My Fish is a framework for managing your fish shell configuration.

```bash
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
```

### Install Node Version Manager (NVM)

NVM is a version manager for Node.js, designed to manage multiple installations of Node.js.

Get the latest installation script from the [GitHub repository](https://github.com/nvm-sh/nvm)

Once set up, you should install the `oh-my-fish` plugin for NVM:

```bash
omf install nvm
```

Test that NVM is installed correctly by running:

```bash
nvm --version
```

### Install GNUPG

GnuPG is a complete and free implementation of the OpenPGP standard as defined by RFC4880 (also known as PGP).

```bash
brew install gnupg
```

### Install GPG Suite

GPG Suite is a macOS application that provides a graphical interface for GnuPG.

You can download the latest version from the [GPG Suite website](https://gpgtools.org/).

## 4. Setup SSH for GitHub

You'll need to create an SSH key to allow repository actions on GitHub using SSH instead of HTTPS.

You can find guides for setting up SSH keys on GitHub in the [official documentation](<(https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh)>). Here are the general steps:

Generate the SSH key:

> [!NOTE]
> The email address you use here should be the same as the one you use for your GitHub account. Not the `no-reply` email.

```bash
# Bit size is important. By default use 4096.
ssh-keygen -t ed25519 -C "your.email@example.com"
```

Once you have generated the SSH key, you can add it to your SSH agent:

```bash
# Start the SSH agent in the background
eval "$(ssh-agent -s)"
# Add your SSH private key to the ssh-agent
ssh-add ~/.ssh/id_ed25519
```

Next, copy the SSH public key to your clipboard:

```bash
# macOS
pbcopy < ~/.ssh/id_ed25519.pub
```

Now you can add the SSH key to your GitHub account. Go to your GitHub account settings, navigate to "SSH and GPG keys", and click on "Add SSH key". Select the key type as "Authentication Key" and paste the key you copied earlier into the field provided.

You can now test your SSH connection to GitHub:

```bash
ssh -T git@github.com
```

## 5. Clone the dotfiles repository using SSH

Now that you have Git and SSH set up, you can clone your dotfiles repository. This will create a local copy of the repository on your machine.

> [!NOTE]
> This should succeed without any issues if you have SSH set up correctly.

```bash
cd ~/
git clone git@github.com:SeanCassiere/dotfiles.git
```

This will create a directory called `dotfiles` in your home directory. You can navigate into this directory using:

```bash
cd ~/dotfiles
```

## 6. Setup GPG for Git Signing

GPG is used to sign your commits and tags. This is an optional step, but it's a good practice to sign your commits.
You can find instructions for setting up GPG keys in the [official documentation](https://docs.github.com/en/github/authenticating-to-github/managing-commit-signature-verification).

Make sure you have GPG installed. You can check if it's installed by running:

```bash
gpg --version
```

If it's not installed, you can install it using Homebrew:

```bash
brew install gnupg
```

You'll also want to install GPG Suite, which provides a graphical interface for GPG. You can download it from the [GPG Suite website](https://gpgtools.org/).

> [!NOTE]
> GPG Suite is not required, but it makes managing your GPG keys much easier.

Once you've installed GPG, you can generate a new GPG key. This key will be used to sign your commits and tags.

If possible, import your existing GPG key from your old machine. To do this, you can use the following command:

> [!NOTE]
> You can find this key on your old machine in the `~/.gnupg/private-keys-v1.d` directory. Copy this directory to your new machine.

```bash
gpg --import /path/to/your/gpg/key
```

If you don't have an existing GPG key, you can create a new one using the following command:

```bash
gpg --full-generate-key
```

This will prompt you to select the key type, key size, and expiration date. You can choose the defaults for most of these options.

Once you've generated your GPG key, you can list your keys using:

```bash
gpg --list-secret-keys --keyid-format LONG
```

You'll need to grab your signing key ID from the output. It will look something like this:

```
sec   rsa4096/3AA5C34371567BD2 2023-10-27 [SC] [expires: 2024-10-26]
      F1BA9CF1BA9C7BD2F1BA9CF1BA9C             SeanCassiere <33615041+SeanCassiere@users.noreply.github.com>
```

In this case, the key ID is `3AA5C34371567BD2`. It'll always be the bit after the `rsa4096/` part.

You can now configure Git to use this GPG key for signing commits and setup automatic signing. Run the following command, replacing `3AA5C34371567BD2` with your own key ID:

```bash
git config --global user.signingkey 3AA5C34371567BD2
git config --global commit.gpsign true
git config --global commit.gpgsign true
git config --global tag.gpgsign true
```

Once this is done, create a test repository outside of the `dotfiles` folder and test that you are be able to sign your commits and tags using GPG. You can test this by creating a new commit and checking the signature:

```bash
# Create a new commit
git commit -m "Test commit"
# Check the signature
git log --show-signature
```

If you have a passphrase set for your GPG key, you'll be prompted to enter it when signing commits. You can configure the GPG agent to cache your passphrase for a certain amount of time, so you don't have to enter it every time. You can do this by adding the following lines to your `~/.gnupg/gpg-agent.conf` and `~/.gnupg/gpg.conf` files:

```bash
# ~/.gnupg/gpg-agent.conf
allow-preset-passphrase
allow-loopback-pinentry
default-cache-ttl 31536000
max-cache-ttl 31536000
default-cache-ttl-ssh 31536000
max-cache-ttl-ssh 31536000
default-cache-ttl 31536000
```

```bash
# ~/.gnupg/gpg.conf
use-agent
pinentry-mode loopback
no-emit-version
```

After making these changes, restart the GPG agent:

```bash
gpgconf --kill gpg-agent
gpgconf --launch gpg-agent
```

Now you should be able to sign your commits and tags without having to enter your passphrase every time.

Once you are able to sign your commits and tags, you should configure your GPG key on GitHub. You can do this by copying your GPG public key to your clipboard:

```bash
gpg --armor --export 3AA5C34371567BD2 | pbcopy
```

Then, go to your GitHub account settings, navigate to "SSH and GPG keys", and click on "New GPG key". Paste the key you copied earlier into the field provided.

## 7. Create symlinks to the dotfiles

Now that the repository is cloned, you can create symlinks to the dotfiles in your home directory. This will allow you to use the dotfiles without having to copy them manually.

There's a script in the `dotfiles` directory that will create symlinks for you. You can run it using:

```bash
# Make sure the script is executable
chmod +x ~/dotfiles/setup-symlinks.sh
# Run the script
~/dotfiles/setup-symlinks.sh
```

This script will create symlinks for all the dotfiles in the `dotfiles` directory to your home directory.
You can also create symlinks manually if you prefer. Here are some examples:

```bash
ln -s ~/dotfiles/.zshrc ~/.zshrc # -- file symlink
ln -s ~/dotfiles/.config/fish/config.fish ~/.config/fish/config.fish
ln -s ~/dotfiles/.config/nvim ~/.config/nvim # -- folder symlink
```

## 8. Homebrew Bundle Install

Homebrew Bundle is a Homebrew extension that allows you to manage your Homebrew packages using a `Brewfile`. This is useful for keeping track of the packages you have installed and for easily installing them on a new machine.

Install Homebrew Bundle at `~/dotfiles/Brewfile` using the following command:

```bash
brew bundle
```

This will install all the packages listed in the `Brewfile`.

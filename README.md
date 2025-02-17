# dotfiles

## Installation

1. Generate a new ssh key to github; the process is automated by the
   `github-ssh-keygen.sh` script:
```
curl https://raw.githubusercontent.com/saliola/dotfiles/HEAD/github-ssh-keygen.sh | sh -s "saliola@gmail.com"
```

2. [Add the new ssh key to github](https://github.com/settings/keys)

3. Install Xcode Command Line tools:
```
xcode-select --install
```

4. Clone this repo (this requires installation of xcode tools):
```
git clone git@github.com:saliola/dotfiles.git ~/.dotfiles
```

5. Run the installation script:
```
cd ~/.dotfiles
./install.sh
```

## References

- [Getting Started with Dotfiles](https://driesvints.com/blog/getting-started-with-dotfiles)

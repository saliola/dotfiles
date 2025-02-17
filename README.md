# dotfiles

## Installation

1. Generate a new ssh key to github; the process is automated by the
   `github-ssh-keygen.sh` script:
```
curl https://raw.githubusercontent.com/driesvints/dotfiles/HEAD/github-ssh-keygen.sh | sh -s "saliola@gmail.com"
```

2. Add the new ssh key to github.

3. Clone this repo:
```
git clone git@github.com:saliola/dotfiles.git ~/.dotfiles
```

3. Run the installation script:
```
cd ~/.dotfiles
./install.sh
```

## References

- [Getting Started with Dotfiles](https://driesvints.com/blog/getting-started-with-dotfiles)

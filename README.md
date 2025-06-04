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

4. Clone this repo:
```
git clone git@github.com:saliola/dotfiles.git ~/.dotfiles
```

5. Run the installation script:
```
cd ~/.dotfiles
sh install.sh
```

6. Other apps to install: MS Office, etc.

7. Log in to various services/apps:
   - ownCloud
   - Fantastical
   - Google Chrome
   - OneDrive
   - Todoist
   - gh
   - reMarkable

8. Compile/Install SageMath


## Manual configuration

- Remove Todoist shortcut for quick-add (it is set to Option-Space):
    - go to the preferences in the Todoist app
    - search for "Keyboard Shortcuts"
    - click on the X under Quick Add Task to clear the shortcut


## References

- [Getting Started with Dotfiles](https://driesvints.com/blog/getting-started-with-dotfiles)

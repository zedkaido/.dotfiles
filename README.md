# .dotfiles

> Enlightenment is the unprogrammed state.

# Setup on new user/device

```bash
git clone --recursive --separate-git-dir=$HOME/.dotfiles git@github.com:zedkaido/.dotfiles.git $HOME
```

High chances it will error if you have any conflicting dotfiles files in
your `$HOME` directory. In that case `clone` the repo into a `tmp` folder and
`rsync` the files from the `repo` into your `$HOME` directory:
```bash
git clone --recursive --separate-git-dir=$HOME/.dotfiles git@github.com:zedkaido/.dotfiles.git /tmp/.dotfiles
rsync --recursive --verbose --exclude '.git' /tmp/.dotfiles $HOME/
rm -r /tmp/.dotfiles
```

For `submodules`:
```bash
git submodule init # reads `.gitmodules` and sets up internal git data structures to track the submodules
git submodule update # clones the submodule repositories if they haven't been cloned already
```
```bash
# (optional)
cd ~/.dotfiles
git checkout master # otherwise you will be working in a detached HEAD state
```

---

# Setup from scratch

```bash
mkdir $HOME/.dotfiles
git init --bare $HOME/.dotfiles
```

```bash
# .zshrc
alias dot='$(which git) --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

```bash
dot remote add github git@github.com:[username]/.dotfiles.git
dot config --local status.showUntrackedFiles no
```

Kaboom! That's it! Now just add all your goodies in there.
```bash
dot add .zshrc
dot commit -m "add .zshrc"
dot push --set-upstream github master
```

For `submodules`:
```bash
dot submodule add <repo_url> <submodule_path>
```

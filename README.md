# :wrench: .dotfiles
## Basic Worflow
### 1. Install [stow](https://www.gnu.org/software/stow/)
```
sudo pacman -S stow
```

### 2. `dotfiles` structure
```
dotfiles
├── git
│   └── .gitconfig
├── .gitignore
├── i3
│   └── .config
│       └── i3
│           └── config
├── nvim
│   └── .config
│       └── nvim
│           ├── autoload
│           ├── init.vim
│           └── plugged
└── zim
    └── .zimrc
```

### 3. Symlink each folder with `stow`
```sh
cd dotfiles
stow git && stow i3 # && stow ...
```

## References
1. [Manage Your Dotfiles with GNU Stow](https://jonleopard.com/dotfile-management-with-gnu-stow/)

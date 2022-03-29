<center>

# ~/ Sweet ~/

Dotfiles and configs for a whole lot of my favorite things.

</center>

## List of key configs

| Config Name | Description                                                                      |
| ----------- | -------------------------------------------------------------------------------- |
| [Zsh]       | Shell (bash alternative) nice and fancy with syntax highlighting and suggestions |
| [tmux]      | Terminal multiplexer. tldr; windows, splits, detaching etc for terminals         |
| [nvim]      | _Better_ vim alternative 😎                                                      |
| [awesome]   | Very hackable Window Manager configured in lua                                   |
| [rofi]      | Nice customizable run window                                                     |

[zsh]: https://www.zsh.org/
[tmux]: https://github.com/tmux/tmux/wiki
[nvim]: https://neovim.io/
[awesome]: https://awesomewm.org/
[rofi]: https://github.com/davatorium/rofi

## Install

```bash
git clone git@github.com:kalvinpearce/dotfiles.git ~/.dotfies
git submodule update --init
# Create ~/.dotfiles/.dotter/local.toml and populate with desired changes (see below)

# Deploying
chmod +x ~/.dotfiles/.dotter/dotter
~/.dotfiles/.dotter/dotter --dry-run

# If happy with the chagnes:
~/.dotfiles/.dotter/dotter
```

## _local.toml_

To deploy configs you need to specify which ones you want (and any overrides you want).
Create a file `~/.dotfiles/.dotter/local.toml` with the following

```toml
packages = ["zsh", "git"]
```

You can also rename `~/.dotfiles/.dotter/local.toml.template` -> `~/.dotfiles/.dotter/local.toml`

### Note

Using [dotter](https://github.com/SuperCuber/dotter/) to manage my dotfiles as it almost perfectly fits my requirements.

I want my dotfiles to be:

- easy to maintain and update all in one place
- symlink to correct location rather than copy the file over
- keep track of what is deployed and where so if I remove a file it won't be left behind
- cross platform (linux, windows, mac)
- allow easy configuring of what configs I want to deploy per system
- allow easy per machine overrides to configs and deploy locations

Dotter fits all of these pretty well and so far has been fairly simple to get working.

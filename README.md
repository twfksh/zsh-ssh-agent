# zsh-ssh-agent

An utility plugin for managing `ssh-agent` in `zsh`. This plugin automatically starts and manages `ssh-agent` whenever a new ternimal session starts. After running `zsh-ssh-agent`, you only need to `ssh-add` your keys once. The plugin will handle the rest.

## Usage

To use `zsh-ssh-agent`, simply run the following command:
```zsh
zsh-ssh-agent
```


## Installation

To install `zsh-ssh-agent` using `zap`, a minimal zsh plugin manager, add the following line to your `.zshrc` file:
```zsh
plug 'toufiq7r/zsh-ssh-agent'
```

### Autostart

To ensure `ssh-agent` starts automatically when you open a new terminal session, add the following line to your `~/.zshrc` file:
```zsh
zsh_ssh_agent
```


## Configuration

For seamless integration with `ssh-agent`, add the following line to `~/.ssh/config` file:
```
AddKeysToAgent yes
```

With this option enabled keys used by `ssh` will be automatically added to the `ssh-agent`, no need to call `ssh-add` everytime.


## Note

This is a fork of amazing `ivakyb/fish_ssh_agent` that I've been using on fish shell.

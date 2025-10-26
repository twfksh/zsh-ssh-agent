# zsh-ssh-agent

A bloat free utility plugin for managing `ssh-agent` in `zsh`. This plugin automatically starts and manages `ssh-agent` whenever a new ternimal session starts and adds your default SSH keys (`id_rsa`, `id_ed25519`).

### Installation

To install `zsh-ssh-agent` using `zap`, a minimal zsh plugin manager, add the following line to your `.zshrc` file:
```zsh
plug 'twfksh/zsh-ssh-agent'
```

### Autostart

To ensure `ssh-agent` starts automatically when you open a new terminal session, add the following line to your `~/.zshrc` file:
```zsh
zsh_ssh_agent
```


### Configuration

For seamless integration with `ssh-agent`, add the following line to `~/.ssh/config` file:
```
AddKeysToAgent yes
```

Recommended if you want all keys used by `ssh` to be added automatically.

### Note

Inspired by `ivakyb/fish_ssh_agent` that I've been using on fish shell.

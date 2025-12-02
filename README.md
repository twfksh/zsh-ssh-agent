# zsh-ssh-agent

A bloat free utility plugin for managing `ssh-agent` in `zsh`. This plugin automatically starts and manages `ssh-agent` whenever a new ternimal session starts.

### Installation

To install `zsh-ssh-agent` using `zap`, a minimal zsh plugin manager, add the following line to your `.zshrc` file and you're good to go.
```zsh
plug 'twfksh/zsh-ssh-agent'
```

### Configuration

For seamless integration with `ssh-agent`, add the following line to `~/.ssh/config` file:
```
Host *
    AddKeysToAgent yes
```

Recommended if you want all keys used by `ssh` to be added automatically.

If you have multiple SSH keys for different services (GitHub, GitLab, AWS, etc.), you can specify them explicitly in your `.ssh/config`:
```
# GitHub
Host github.com
    User git
    IdentityFile ~/.ssh/id_github
    AddKeysToAgent yes
```

Each Host entry can have its own key. `AddKeysToAgent yes` ensures that key is automatically loaded when connecting. You can still use the script to auto-load a default set of keys for convenience.

Inspired by `ivakyb/fish_ssh_agent` that I've been using on fish shell.

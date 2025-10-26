#!/bin/zsh

# load SSH env file
[[ -z "$SSH_ENV" ]] && SSH_ENV="$HOME/.ssh/env"

# to check if ssh-agent have already started
__ssh_agent_started() {
  if [[ -f "$SSH_ENV" ]] && [[ -z "$SSH_AGENT_PID" ]]; then
    chmod 600 "$SSH_ENV" 2>/dev/null
    if ! source "$SSH_ENV" >/dev/null 2>&1; then
      unset SSH_AGENT_PID SSH_AUTH_SOCK
    fi
  fi

  [[ -z "$SSH_AGENT_PID" ]] && return 1

  if ps -p "$SSH_AGENT_PID" -o comm= 2>/dev/null | grep -q '^ssh-agent$'; then
    agent_user=$(ps -p "$SSH_AGENT_PID" -o user= | tr -d ' ')
    if [[ "$agent_user" != "$USER" ]]; then
      unset SSH_AGENT_PID SSH_AUTH_SOCK
      return 1
    fi
    return 0
  else
    unset SSH_AGENT_PID SSH_AUTH_SOCK
    return 1
  fi
}

# to start a ssh-agent instance, and store necessary env variables to $SSH_ENV
__ssh_agent_start() {
  (umask 066; ssh-agent -s > "$SSH_ENV")
  chmod 600 "$SSH_ENV"
  source "$SSH_ENV" >/dev/null
}

# auto-add default SSH keys (e.g. id_rsa and id_ed25519, most common)
__ssh_add_keys() {
  [[ -z "$SSH_AGENT_PID" ]] && return 1

  for key in ~/.ssh/id_rsa ~/.ssh/id_ed25519; do
    [[ -f "$key" ]] || continue
    ssh-add -l | grep -q "$(ssh-keygen -lf "$key" | awk '{print $2}')" || ssh-add "$key" >/dev/null 2>&1
  done
}

# to manage ssh-agent for zshell(zsh)
zsh-ssh-agent() {
  if ! __ssh_agent_started; then
    __ssh_agent_start
  fi

  __ssh_add_keys
}


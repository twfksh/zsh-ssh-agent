#!/bin/zsh

# to check if ssh-agent have already started
__ssh_agent_started() {
  if [[ -f $SSH_ENV ]] && [[ -z $SSH_AGENT_PID ]]; then
    source $SSH_ENV > /dev/null
  fi

  if [[ -z $SSH_AGENT_PID ]]; then
    return 1
  fi

  if ps -p $SSH_AGENT_PID -o comm= | grep -q '^ssh-agent$'; then
    return 0
  else
    return 1
  fi
}

# to start a ssh-agent instance, and store necessary env variables to $SSH_ENV
__ssh_agent_start() {
  ssh-agent -s > $SSH_ENV
  chmod 600 $SSH_ENV
  source $SSH_ENV > /dev/null
}

# to manage ssh-agent for zshell(zsh)
zsh-ssh-agent() {
  if [[ -z $SSH_ENV ]]; then
    export SSH_ENV=$HOME/.ssh/env
  fi

  if ! __ssh_agent_started; then
    __ssh_agent_start
  fi
}

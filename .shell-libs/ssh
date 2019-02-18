link_ssh_agent() {
  if [[ $SSH_AUTH_SOCK =~ "/tmp/" ]]; then
    ln -sf $SSH_AUTH_SOCK ${HOME}/.ssh/ssh-auth-sock
  fi
}

ssh_knownhost_rm() {
  if [ $# -ne 1 ]; then
    echo "USAGE: please provide the line number of the key you want to remove"
  else
    line_nr=$1
    if [ $(uname) == "Darwin" ]; then
      sed -i '' "${line_nr}d" ${HOME}/.ssh/known_hosts
    fi

    if [ $(uname) == "Linux" ]; then
      sed -i "${line_nr}d" ${HOME}/.ssh/known_hosts
    fi
  fi
}

ssh_load_key() {
  local key=${1:?no key provided}
  if [ ! -r ${HOME}/.ssh/${key} ]; then
    echo "Key not found."
    return 1
  fi

  if ! ssh-add -l | grep ".ssh/${key}"; then
    ssh-add ${HOME}/.ssh/${key}
  fi
}

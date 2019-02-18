#!/usr/bin/env bash

_load_env()
{
  COMPREPLY=($(cd ${HOME}/.env; compgen -f ${COMP_WORDS[COMP_CWORD]}))
}
complete -o nospace -F _load_env load_env

_unload_credentials() {
  COMPREPLY=($(compgen -W "$(echo ${LOAD_ENV} | tr ' ' '\n' | egrep ^credentials)" -- ${COMP_WORDS[COMP_CWORD]}))
}
complete -o nospace -F _unload_credentials unload_credentials

export DOTLIBS="${DOTLIBS} docker"

if [[ $(uname) == "Darwin" ]]; then
    # docker-machine stuff
    if [ $(which docker-machine) ]; then

      docker_if_not_running() {
        if [ $(docker-machine status ${C_DOCKER_MACHINE}) != 'Running' ]; then
          dminit
        fi
      }

      dminit() {
        local machine=${1:-${C_DOCKER_MACHINE}}
        docker-machine start ${machine}
        dmshell
      }

      dmshell() {
        local machine=${1:-${C_DOCKER_MACHINE}}
        eval $(docker-machine env ${machine})

        # If liquidprompt is used, prefix prompt with whale
        if typeset -F _lp_bool >/dev/null; then
          prompt_tag "🐳 "
        fi
      }

      dmstop() {
        local machine=${1:-${C_DOCKER_MACHINE}}
        docker-machine stop ${machine}
        unset DOCKER_MACHINE_NAME DOCKER_CERT_PATH DOCKER_TLS_VERIFY DOCKER_HOST
        prompt_tag ""
      }

      dmhosts() {
        local DMHOSTNAME="dockerhost"
        local machine=${1:-${C_DOCKER_MACHINE}}

        sudo -v

        grep ${DMHOSTNAME} /etc/hosts > /dev/null && sudo sed -i '' "/${DMHOSTNAME}/d" /etc/hosts
        sudo echo "$(docker-machine ip ${machine}) ${DMHOSTNAME}" | sudo tee -a /etc/hosts
      }

      dmntp() {
        local machine=${1:-${C_DOCKER_MACHINE}}
        docker_if_not_running
        echo "Syncing Docker machine ${machine} with NTP Servers..."
        docker-machine ssh ${machine} sudo ntpclient -s -h pool.ntp.org

        # Give NTP some time to sync...
        sleep 3

        echo "Current date on Docker machine ${machine}:"
        docker run -ti --rm alpine date
      }

    fi # end docker-machine
fi

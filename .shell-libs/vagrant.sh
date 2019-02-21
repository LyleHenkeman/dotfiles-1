export DOTLIBS="${DOTLIBS} vagrant"

vgrebuild() {
  if [ $# -gt 0 ]; then
    v_machines=$@
  else
    v_machines=" "
  fi

  vagrant destroy -f $v_machines
  vagrant up $v_machines
}

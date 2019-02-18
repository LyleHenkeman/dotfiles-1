if [[ $DOTFILESVERBOSE == "true" ]]; then
  echo -n "git "
fi

git_stats() {
  echo "Git stats for $(git me) for today:"
  git log --author="$(git me)" --pretty=tformat: --numstat --since='12am' | \
  awk '{ add += $1 ; subs += $2 ; loc += $1 - $2 } END \
  { printf "added lines: %10s \nremoved lines: %8s \ntotal lines: %10s\n",add,subs,loc }' -
}

cgit() {
  c_repos=$(find -L . -maxdepth 2 -name .git -type d -print | cut -d'/' -f2)
  c_basedir=${PWD}
  for repo in ${c_repos}; do
    echo "## [${repo}] "
    git --git-dir="${c_basedir}/${repo}/.git" \
      --work-tree="${c_basedir}/${repo}" \
      "$@"
    echo -e ""
  done
}

cblame_stats() {
  c_repos=$(find . -maxdepth 2 -name .git -type d -print | cut -d'/' -f2)
  c_basedir=${PWD}

  for repo in ${c_repos}; do
    echo "## [${repo}] "
    cd ${repo}
    git ls-files | while read f; do git blame --line-porcelain $f | grep '^author '; done | sort -f | uniq -ic | sort -n
    echo -e ""
    cd ${c_basedir}
  done
}

# If Github's 'hub' is installed, alias 'git' to it
if which hub &> /dev/null ; then
  alias git=hub
fi

alias hgit="git --git-dir=${HGIT_PATH}/.git --work-tree=${HGIT_PATH}"
alias hupdate="hgit pull --rebase --recurse-submodules --prune --autostash"

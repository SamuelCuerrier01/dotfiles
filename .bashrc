#
# ~/.bashrc
#
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

echo "Bienvenue, $USER !"

alias ls='ls --color=auto'
alias lsla='ls -l -a'
alias grep='grep --color=auto'
alias grepc='grep --color=always'
alias c='clear'

creerdossier() {
  mkdir "$1"
  cd "$1"
}

creerfichier() {
  touch "$1"
  nvim "$1"
}

if [ "$USER" = "samuelcuerrier" ]; then
  PS1='[\h \W]\$ '
fi

mygrep() {
  grep -i "$1" "$2"
}

gitall() {
  git init
  git branch -M main
  git add .
  git remote add origin "$2"
  git commit -m "$1"
  git push --force origin main
}

export PATH="$HOME/bin:$PATH"

# Exports

export GITEDITOR="code -w"

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# export PATH="/usr/local/opt/ruby/bin:$PATH" # Ruby

# Aliases

alias ls="ls -laGh"

# Prompt

autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats '%b'

git_prompt() {
  BRANCH=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/*\(.*\)/\1/')

  if [ ! -z $BRANCH ]; then
    echo -n "%F{yellow}$BRANCH"

    if [ ! -z "$(git status --short)" ]; then
      echo " •"
    fi
  fi
}

setopt PROMPT_SUBST

PROMPT='%F{6}%m %F{13}${PWD/#$HOME/~}%F{5}$(git_prompt)%F{gray} → '

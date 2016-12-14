# Path to your oh-my-zsh installation.
export ZSH=$HOME/.dotfiles/zsh/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="yujun"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git ruby rails osx autojump python pip github gnu-utils history-substring-search zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="$HOME/.rvm/gems/ruby-2.1.2/bin:$HOME/.rvm/gems/ruby-2.1.2@global/bin:$HOME/.rvm/rubies/ruby-2.1.2/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:$HOME/.rvm/bin"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
export TERM=xterm-256color
[ -n "$TMUX" ] && export TERM=screen-256color

export CLICOLOR=true
export LSCOLORS=ExFxCxDxBxegedabagacad

alias ls='ls -FG' # 한글 표시, 디렉토리면 뒤에 / 표시, 확장자별 색상 표시
alias ll="ls -lv"
alias l='ls -alh'

#alias ls='ls -G'
alias tmux="TERM=screen-256color-bce tmux"

alias tl='tmux list-sessions'
alias ta='tmux attach-session -t'

alias croak='ssh -i ~/.ssh/watcha_music.pem croak@ec2-54-248-17-108.ap-northeast-1.compute.amazonaws.com'
alias sa='eval `ssh-agent`; ssh-add ~/.ssh/watcha_music.pem ; ssh-add ~/.ssh/dry.pem'
alias memo='cd ~/memo ; vim'

alias rmvim='rm -rf ~/.dotfiles/vim/tmp/swap/*'
alias shortcuts='cat ~/.dotfiles/vim/doc/shortcuts.txt | less'

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/go/bin
alias ser='ssh -i ~/.ssh/id_rsa 128.199.107.14'
alias mar='ssh plmmoknn@martini.snucse.org'
alias ubu='ssh -i ~/.ssh/id_rsa parallels@10.211.55.4'
# alias prod='ssh -i ~/.ssh/singbro.pem violet@52.79.39.32'
alias prod='ssh -i ~/.ssh/singbro.pem violet@52.79.119.63'
alias spot='ssh -i ~/.ssh/singbro.pem violet@52.79.155.29'
alias cdser='cd ~/Dropbox/server'
export PATH=/usr/local/share/python:/usr/local/bin:$PATH
export PATH=/opt/homebrew-cask/Caskroom/coqide/8.4pl5/CoqIDE_8.4pl5.app/Contents/MacOS:$PATH


# OPAM configuration
. $HOME/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export NVM_DIR="/Users/yujun/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
unset PYTHONPATH

# The next line updates PATH for the Google Cloud SDK.
if [ -f /Users/yujun/git/google/google-cloud-sdk/path.zsh.inc ]; then
  source '/Users/yujun/git/google/google-cloud-sdk/path.zsh.inc'
fi

# The next line enables shell command completion for gcloud.
if [ -f /Users/yujun/git/google/google-cloud-sdk/completion.zsh.inc ]; then
  source '/Users/yujun/git/google/google-cloud-sdk/completion.zsh.inc'
fi

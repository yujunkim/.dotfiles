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
if [[ -n $SSH_CONNECTION ]]; then
 export EDITOR='vim'
else
 export EDITOR='mvim'
fi

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
alias vi="vi '+syn on'" # vi 쓸 때 syntax highlighting - 이건 보너스
alias ll="ls -lv"
alias l='ls -alh'

#alias ls='ls -G'
alias vim="$EDITOR -v"
alias tmux="TERM=screen-256color-bce tmux"

alias tl='tmux list-sessions'
alias ta='tmux attach-session -t'

alias croak='ssh -i ~/.ssh/watcha_music.pem croak@ec2-54-248-17-108.ap-northeast-1.compute.amazonaws.com'
alias sa='eval `ssh-agent`; ssh-add ~/.ssh/watcha_music.pem ; ssh-add ~/.ssh/dry.pem'
alias memo='cd ~/memo ; vim'

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
alias ser='ssh -i ~/.ssh/hi_id_rsa 128.199.89.244'
export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH
export PATH=/usr/local/share/python:/usr/local/bin:$PATH

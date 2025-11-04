# ~/Documents/.bashrc for a-shell (dash shell)
 
 # Define the prompt with colors - simple arrow
 export PS1='\[\033[34m\]\w\[\033[0m\] \[\033[32m\]➜\[\033[0m\] '
 
 # History settings
 export HISTSIZE=10000
 export HISTFILESIZE=10000
 
 # Useful aliases
 alias ll='ls -lah'
 alias la='ls -A'
 alias l='ls -CF'
 alias ..='cd ..'
 alias ...='cd ../..'
 alias v='vim'
 alias vi='vim'
 alias vimrc='vim ~/Documents/.vimrc'
 alias bashrc='vim ~/Documents/.bashrc'
 alias reload='source ~/Documents/.bashrc'
 
 # Navigation shortcuts
 alias docs='cd ~/Documents'
 alias writing='cd ~/Documents/writing'
 alias notes='cd ~/Documents/notes'
 
 # Git shortcuts
 alias gs='lg2 status'
 alias ga='lg2 add'
 alias gc='lg2 commit -m'
 alias gp='lg2 push'
 alias gl='lg2 log --oneline -10'
 
 # Welcome message
 date '+%A, %B %d, %Y'

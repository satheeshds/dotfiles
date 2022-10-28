alias ls='ls --group-directories-first --color=auto'
alias ll='ls -lh'
alias la='ll -A'
alias lt='ll -tr'
alias lu='lt -u'

# whitespace at the end causes the next command word after sudo to
# also be checked for alias expansion
alias sudo='sudo '

## lvm
alias lvs='sudo lvs'
alias vgs='sudo vgs'
alias pvs='sudo pvs'
alias lvdisplay='sudo lvdisplay'
alias pvdisplay='sudo pvdisplay'
alias vgdisplay='sudo vgdisplay'

## global aliases
alias -g L='| less'
alias -g N='2> /dev/null'
alias -g G='| rg'
alias -g J='| jq'
alias -g H='| head'
alias -g T='| tail'
alias -g F='| fzf'
alias -g X='| xargs'
alias -g V='| vim -'


## misc
alias s='ssh'
alias c="date -R && echo -e && khal calendar --notstarted"
alias eject='sudo eject'
alias rcp='rsync --progress'
alias lsblk='lsblk -o +MODEL -o +LABEL'
alias drop_caches='echo 3 | sudo tee /proc/sys/vm/drop_caches'

# useful defaults
alias rsync="ionice -c 3 rsync"
alias iostat="iostat -mtx"
alias a='alias'
alias n='nvim'

## github cli aliases
alias pr='gh pr create --title $*'
alias review='gh pr checkout $*'

# docker compose
alias dcd='docker compose down'
alias dcu='docker up -d'

# java test
alias jtest='java org.junit.runner.JUnitCore $*'

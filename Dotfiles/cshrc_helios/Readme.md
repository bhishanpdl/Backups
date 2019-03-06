We can write some aliases for the C-shell configuration file `.cshrc`.


```
alias cd            'cd \!*;echo $cwd'
alias rm            'rm -i'
alias pwd           'echo $cwd'

alias .             'echo $cwd'
alias ..            'set dot=$cwd;cd ..'
alias ,             'cd $dot '

alias ls 'ls -'
alias cls 'clear; ls'
alias la  'ls -a'
alias ll  'ls -la'
alias ls  'ls -F'

```

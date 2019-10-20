# 一个兼容bash的PS1主题

# 获取git分支
function parse_git_branch {
   git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

if [ `id -u` -eq 0  ]
then
	#root
	PS1='\[\033[0;35m\]\u@\h:\[\033[0;36m\]\w$(parse_git_branch)\[\033[00m\] \t\n\$ '
else
	#other
	PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;33m\]\w$(parse_git_branch)\[\033[00m\] \t\n\$ '
fi

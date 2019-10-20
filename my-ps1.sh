# 一个兼容bash的PS1主题

# 获取git分支
function parse_git_branch() {
    git_branch=$(git branch --no-color 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')
    git_status=$(git status -s 2>/dev/null)
    [ -z "$git_branch" ] && return 0
    if [ -z "$git_status" ]
    then
        color_echo "${git_branch}O" cyan defalut
    else
        color_echo "${git_branch}X" red defalut
    fi

}

# 颜色输出
function color_echo() {
    text=$1
    fg_color=$2
    bg_color=$3
    start_color="\\033["
    end_color="\\033[0m"
    case $fg_color in
    black)
        start_color="${start_color}30;"
        ;;
    blue)
        start_color="${start_color}34;"
        ;;
    green)
        start_color="${start_color}32;"
        ;;
    cyan)
        start_color="${start_color}36"
        ;;
    red)
        start_color="${start_color}31;"
        ;;
    purple)
        start_color="${start_color}35;"
        ;;
    brown)
        start_color="${start_color}33;"
        ;;
    *)
        start_color="${start_color}39;"
    esac
    case $bg_color in
    black)
        start_color="${start_color}40m"
        ;;
    blue)
        start_color="${start_color}44m"
        ;;
    green)
        start_color="${start_color}42m"
        ;;
    cyan)
        start_color="${start_color}46m"
        ;;
    red)
        start_color="${start_color}41m"
        ;;
    purple)
        start_color="${start_color}45m"
        ;;
    brown)
        start_color="${start_color}43m"
        ;;
    *)
        start_color="${start_color}49m"
    esac
    echo -e "$start_color$text$end_color"
}

if [ $(id -u) -eq 0 ]; then
    #root
    PS1="\$(color_echo '\u@\h:' red default )\$(color_echo '\w' brown defalut)\$(parse_git_branch) \t\n\\$ "
else
    #other
    PS1="\$(color_echo '\u@\h:' green default )\$(color_echo '\w' brown defalut)\$(parse_git_branch) \t\n\\$ "
fi

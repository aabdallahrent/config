export whatbox='moo083@capricorn.whatbox.ca';
export moomachine='mneumark@moomachine.com';
export oneweb='oneweb-01.mneumark.sb.lax1.rent.com';
export webapp='webapp-01.mneumark.sb.lax1.rent.com';
export CLICOLOR=1;
export LSCOLORS=ExFxCxDxBxegedabagacad;

alias moomachine='ssh -A $moomachine';
alias mneumark.com='ssh u35694538@mneumark.com';
alias whatbox="ssh -A $whatbox";

alias oneweb="ssh -A $oneweb";
alias webapp="ssh -A $webapp";

alias be="bundle exec";

#ulimit -n 65536
#ulimit -u 2048

eval `ssh-agent` &> /dev/null;
ssh-add &> /dev/null;

PATH=$HOME/Scripts:/usr/local/sbin:/usr/local/share/npm/bin:$PATH

export BLUE="\[\033[0;34m\]"
# OPTIONAL - if you want to use any of these other colors:
export RED="\[\033[0;31m\]"
export LIGHT_RED="\[\033[1;31m\]"
export GREEN="\[\033[0;32m\]"
export LIGHT_GREEN="\[\033[1;32m\]"
export WHITE="\[\033[1;37m\]"
export LIGHT_GRAY="\[\033[0;37m\]"
# END OPTIONAL
export DEFAULT_COLOR="\[\033[0m\]"

#export PS1="\h:$BLUE\W$DEFAULT_COLOR \u\$ "


# git branch in prompt
function parse_git_branch {
    export branch=`git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`;
}

function prompt_branch {
    parse_git_branch
    if [ $branch ]; then
        export prompt_branch="[$branch]";
    else
        export prompt_branch="";
    fi
}

export PROMPT_COMMAND=prompt_branch;

function get_date {
    date  +"%H:%M:%S"
}

function proml {
    PS1="\u@:\$(get_date):\W$RED \$prompt_branch$DEFAULT_COLOR\$ ";
}
proml

if [ -f /Users/mneumark/.idg_profile ]; then . /Users/mneumark/.idg_profile; fi
eval "$(/Users/mneumark/source/idg/bin/idg init -)"

alias cds="cd ~/source"
alias cdr="cd ~/source/rent"
alias cdi="cd ~/source/idg"
alias cda="cd ~/source/ag"

alias rspec-ordered='bundle exec rspec --order=defined'
[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn

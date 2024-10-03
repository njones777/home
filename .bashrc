#Bash Promp
PS1='\[\e[1;32m\]\u|\t|\W|\$->\[\e[0m\] '

#History Configuration
export HISTFILESIZE=20000
export HISTSIZE=10000
shopt -s histappend
shopt -s cmdhist
HISTCONTORL=ignoredups
export HISTIGNORE="&:ls:[bf]g:exit"

#Color Stuff
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced


#alias
alias l='ls -lht -G'
alias ls='ls -l  -G'
alias lsa='ls -lah -G'
alias rm='rm -i'
alias p='pwd'

#edit bashrc alias
alias brc='vim ~/.bashrc'

#Movement Alias
alias up='cd ..'

#source bashrc alias
alias sbrc='source ~/.bashrc'

#Rust cargo alias
alias cb='cargo build'
alias cc='cargo check'
alias cr='cargo run'
alias cu='cargo update'

#Network Info Script
# Show current network information
netinfo ()
{
	echo "--------------- Network Information ---------------"
	/sbin/ifconfig | awk /'inet addr/ {print $2}'
	echo ""
	/sbin/ifconfig | awk /'Bcast/ {print $3}'
	echo ""
	/sbin/ifconfig | awk /'inet addr/ {print $4}'

	/sbin/ifconfig | awk /'HWaddr/ {print $4,$5}'
	echo "---------------------------------------------------"
}


#Extract Script
extract () {
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xvjf $1    ;;
           *.tar.gz)    tar xvzf $1    ;;
           *.bz2)       bunzip2 $1     ;;
           *.rar)       unrar x $1       ;;
           *.gz)        gunzip $1      ;;
           *.tar)       tar xvf $1     ;;
           *.tbz2)      tar xvjf $1    ;;
           *.tgz)       tar xvzf $1    ;;
           *.zip)       unzip $1       ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1        ;;
           *)           echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
 }


 #Function to help with purger
 gtr_than() {
	echo -n > $2
	#bn=$(basename ${2})
       	#echo $bn	
	find $1 -type f -size +20M -exec basename {} \; >> $2 #"${1}/.mnotr/${bn}"
	sort -o $2 $2

}
. "$HOME/.cargo/env"

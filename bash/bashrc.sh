# ~/.bash_profile
PATH=$PATH:$HOME/bin:$JAVA_HOME/bin

export PATH

# ~/.bashrc
export JAVA_HOME="/local/java/jdk1.8.0_121/"
PATH=$PATH:$HOME/bin:$JAVA_HOME/bin
export PATH

HISTSIZE=5000
HISTFILESIZE=10000
shopt -s histappend
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

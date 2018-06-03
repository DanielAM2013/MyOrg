. $HOME/.bashrc.d/functions
. $HOME/.bashrc.d/history
. $HOME/.bashrc.d/prompt
. $HOME/.bashrc.d/variables
. $HOME/.bashrc.d/environment

source /opt/ros/lunar/setup.bash

PATH="/home/daniel/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/daniel/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/daniel/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/daniel/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/daniel/perl5"; export PERL_MM_OPT;

PATH="/home/daniel/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/daniel/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/daniel/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/daniel/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/daniel/perl5"; export PERL_MM_OPT;

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

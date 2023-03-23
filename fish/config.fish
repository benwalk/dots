# ------------------------------------------------------------------------------
# PATH
# ------------------------------------------------------------------------------
# The default PATH from fish includes:
#   /usr/local/bin /usr/bin /bin /usr/sbin /sbin /usr/local/go/bin
#   /usr/local/MacGPG2/bin
# but to append more:
set -gx PATH $PATH \
~/.bin \
~/.local/bin \
~/.local/sbt/bin \
~/.rbenv \
/Applications/Postgres.app/Contents/Versions/latest/bin \
/Library/Frameworks/Python.framework/Versions/3.7/bin \


# ------------------------------------------------------------------------------
# Fish
# ------------------------------------------------------------------------------
set -gx EDITOR vim

# ------------------------------------------------------------------------------
# Other Variables
# ------------------------------------------------------------------------------

# Go
#set -gx GOPATH ~/go

# Python (pyenv)
#set -gx PYENV_ROOT ~/.pyenv


# Maven Opts
# - `-Xmx4g` sets max heap size to 4G
# - `-Xms512m` sets initial and min heap size to 512M
# - `-Xss32m` sets stack size to 32M
# - `-XX:+UseG1GC` enables the garbage-first (G1) collector
# - `-XX:+TieredCompilation` enables tiered compilation
# - `-XX:+TieredStopAtLevel=1`
#set -xg MAVEN_OPTS "-Xmx4g -Xms512m  -Xss32m -XX:+UseG1GC -XX:+TieredCompilation -XX:TieredStopAtLevel=1"

# Use all kube config files found
#if test -e ~/.kube/config
#  echo "Sourcing Kube configs."
#  set -xg KUBECONFIG (string join ':' ~/.kube/config/*)
#end

# AWS Defaults
#set -xg AWS_REGION us-west-2
#set -xg AWS_DEFAULT_REGION us-west-2
#set -xg AWS_VAULT_KEYCHAIN_NAME login

# Node, NVM
set -x NVM_DIR ~/.nvm

# ------------------------------------------------------------------------------
# Aliases
# ------------------------------------------------------------------------------
# alias redshift='envcrypt ~/.secrets/redshift-prod.gpg psql'


# ------------------------------------------------------------------------------
# EOF
# ------------------------------------------------------------------------------
test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish ; or true
set -g fish_user_paths "/usr/local/opt/terraform@0.11/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/ncurses/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/avr-gcc@8/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/arm-gcc-bin@8/bin" $fish_user_paths

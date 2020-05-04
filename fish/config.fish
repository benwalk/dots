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
~/code/backend/hermit/local \
~/code/user-factory/bin \
/Applications/Postgres.app/Contents/Versions/latest/bin \
/Library/Frameworks/Python.framework/Versions/3.7/bin \
/usr/local/apache-maven-3.5.3/bin \
/usr/local/flyway-5.0.7 \
/usr/local/gradle-4.9/bin \
/usr/local/scala-2.11.8/bin \
/usr/local/opt/openssl@1.1/bin

# ------------------------------------------------------------------------------
# Other Variables
# ------------------------------------------------------------------------------
# Use all kube config files found
set -xg KUBECONFIG (string join ':' ~/.kube/config/*)

# AWS Defaults
set -xg AWS_PROFILE ops-dev
set -xg AWS_DEFAULT_PROFILE ops-dev
set -xg AWS_REGION us-west-2
set -xg AWS_DEFAULT_REGION us-west-2
set -xg AWS_VAULT_KEYCHAIN_NAME login


# ------------------------------------------------------------------------------
# Alias
# ------------------------------------------------------------------------------
# alias redshift='envcrypt ~/.secrets/redshift-prod.gpg psql'

# ------------------------------------------------------------------------------
test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish ; or true

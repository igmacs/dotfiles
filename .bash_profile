GUIX_PROFILE="/home/ignacio/.guix-profile"
. "$GUIX_PROFILE/etc/profile"
unset GUIX_PROFILE

GUIX_PROFILE="$HOME/.config/guix/current"
. "$GUIX_PROFILE/etc/profile"

# Needed for Guix pkg-config to find some libraries while Guix
# coexists with previous package manager
export PKG_CONFIG_PATH="$HOME/.guix-profile/lib/pkgconfig:$HOME/.guix-profile/share/pkgconfig:/usr/lib/x86_64-linux-gnu/pkgconfig:/usr/lib/pkgconfig:/usr/share/pkgconfig"

# Bash history

HISTCONTROL=ignoredups:erasedups
HISTSIZE=-1
HISTFILESIZE=-1

cat ~/.bash_useful_history ~/.bash_history > /tmp/tmp_bash_history;
awk '!seen[$0]++' /tmp/tmp_bash_history > ~/.bash_history;

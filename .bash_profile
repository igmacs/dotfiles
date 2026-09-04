GUIX_PROFILE="/home/ignacio/.guix-profile"
. "$GUIX_PROFILE/etc/profile"
unset GUIX_PROFILE

GUIX_PROFILE="$HOME/.config/guix/current"
. "$GUIX_PROFILE/etc/profile"

# Needed for Guix pkg-config to find some libraries while Guix
# coexists with previous package manager
export PKG_CONFIG_PATH="$HOME/.guix-profile/lib/pkgconfig:$HOME/.guix-profile/share/pkgconfig:/usr/lib/x86_64-linux-gnu/pkgconfig:/usr/lib/pkgconfig:/usr/share/pkgconfig"


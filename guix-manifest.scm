;; This "manifest" file can be passed to 'guix package -m' to reproduce
;; the content of your profile.  This is "symbolic": it only specifies
;; package names.  To reproduce the exact same profile, you also need to
;; capture the channels being used, as returned by "guix describe".
;; See the "Replicating Guix" section in the manual.

(specifications->manifest
 (list "ansible"
       "aspell" ;; GNU spell checker needed by Emacs's flyspell
       "aspell-dict-en"
       "aspell-dict-es"
       "bluez" ;; Linux Bluetooth protocol stack
       "curl"
       "dbus" ;; Needed by bluez
       "direnv" ;; Used by Emacs's envrc package, to easily manage Python environments
       "libreoffice"
       "mpv" ;; Audio and video player
       "nss-certs" ;; needed for curl to work
       "pkg-config" ;; needed by bluez, or at least bluer, it's Rust interface
       "pup" ;; HTML command line parser
       "python-lsp-server"
       "qutebrowser"
       "rbw" ;; Bitwarden client
       "ripgrep"
       "rust"
       "sqlite"
       "syncthing"
       "tidy-html" ;; I use it for pretty-printing HTML in the command line
       "typst"
       "vim"))

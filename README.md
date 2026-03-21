# dotfiles

Just a public repository for my dotfiles, which were previously
private. I don't want to just make them public since that would
probably leak some secret of personal info, so instead I will migrate
them little by little from the private repository to the public one,
and use that as a chance to review and curate them.

## How to use them

Most of these files will be actual dotfiles that just need to be at
the right place, like `~/.bash_profile`. To manage them easily we
replicate the home directory structure in this repository and to sync
them we can just run `stow -d . -t ~ .`. This will create symlinks at
the right locations to the files in this repository not explicitly
excluded in [.stow-local-ignore](.stow-local-ignore).

Other files require more manual steps to be applied and are listed
below

### Guix

I've started using Guix as a package manager since I was curious about
it. Right now it coexists with Ubuntu's apt package manager so it only
manages a few packages, the idea is to migrate them little by little
and always try to use it as the first option to install a new package

To install the packages managed by Guix, install Guix following the
documentation and run `guix package -m guix-manifest.scm`

To update the manifest, just run `guix package --export-manifest` and
merge the output with guix-manifest.scm (if you don't care about
pinning versions, it's fine to just replace it)

### Emacs

Some Emacs files are in the .emacs.d/ folder, but the actual
configuration is not in the init.el file but in the
[emacs.org](emacs.org) file which uses Org Babel and needs to be
tangled manually.

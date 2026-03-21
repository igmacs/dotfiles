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

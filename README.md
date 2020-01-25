## Setting up a new machine 

To set up a new machine to use your version controlled config files, all you need to do is to clone the repository on
your new machine telling git that it is a bare repository:

`git clone --separate-git-dir=$HOME/.dotfiles https://github.com/vuk26/.dotfiles.git ~`

However, some programs create default config files, so this might fail if git finds an existing config file in your
$HOME. In that case, a simple solution is to clone to a temporary directory, and then delete it once you are done:

`git clone --separate-git-dir=$HOME/.dotfiles https://github.com/vuk26/.dotfiles.git tmpdotfiles
rsync --recursive --verbose --exclude '.git' tmpdotfiles/ $HOME/
rm -r tmpdotfiles`

## Alternate version: Setup environment in a new computer 

Make sure to have git installed, then:

1. Clone your github repository

`git clone --bare https://github.com/USERNAME/dotfiles.git $HOME/.dotfiles`

2. Define the alias in the current shell scope

`alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'`

3. Checkout the actual content from the git repository to your `$HOME`

`dotfiles checkout`


*Note that if you already have some of the files you'll get an error message. You can either (1) delete them or (2) back
them up somewhere else.*

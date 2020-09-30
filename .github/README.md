## Setup environment in a new computer 

Make sure to have git installed, then:

1. Clone your github repository

`git clone --bare https://github.com/USERNAME/dotfiles.git $HOME/.dotfiles`

2. Define the alias in the current shell scope

`alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'`

3. Checkout the actual content from the git repository to your `$HOME`

`dotfiles checkout`


*Note that if you already have some of the files you'll get an error message. You can either (1) delete them or (2) back
them up somewhere else.*


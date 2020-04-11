#!/bin/bash
param=$1
package=$2

if [[ -z "$param" ]] && [[ -z "$package" ]]; then
	echo -e "Command not recognised. Options are:"
	echo -e "up ................. [update]"
	echo -e "rm [package] ....... [remove package, leave deps installed]"
	echo -e "rmall [package] .... [remove package and deps not req by others]"
	echo -e "yay -R [package] .[remove package]"
	echo -e "yay -Rsn [package] [completely remove package including dependencies]"

# update
elif [[ "$param" == "up" ]] && [[ -z "$package" ]]; then
	sudo pacman -Syu

# rm single package, leave all dependencies installed
elif [[ "$param" == "rm" ]] && [[ -n "$package" ]]; then
	sudo pacman -R "$package"

# rm package and its dependencies not required by others installed
elif [[ "$param" == "rmall" ]] && [[ -n "$package" ]]; then
	sudo pacman -Rs "$package"
else
	echo -e "Command not recognised. Options are:"
	echo -e "up ................. [update]"
	echo -e "rm [package] ....... [remove package, leave deps installed]"
	echo -e "rmall [package] .... [remove package and deps not req by others]"
fi

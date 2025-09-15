#!/usr/bin/env bash

args=$@

targetDir=$HOME/.config/mjvim
mkdir -p $targetDir
flags="--verbose=1 -t ${targetDir}"

if [[ "$args" == "--uninstall" ]]; then
	echo 'Uninstalling'
	flags="-D --verbose=1 -t $targetDir"
fi

stow $flags . # newest

# # Create alias for starting nvim with custom config
# echo "alias mjvim='NVIM_APPNAME=.mjvim nvim'" >> ~/.bashrc
# echo "Alias 'mjvim' added to ~/.bashrc. Run 'source ~/.bashrc' or restart terminal to use."

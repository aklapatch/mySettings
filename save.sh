#/bin/sh

files=".vimrc .i3/config"
dir=$(dirname "$0")

for a in $files
do
	echo "copying $a to $dir"
	install -D ~/$a $dir/$a
done

#/bin/sh
#deploy.sh

files='.vimrc .i3/config'
for a in $files
do
	echo "copying $a to ~/$a"
	cp $a ~/$a
done

#/bin/sh
#deploy.sh

files=$(cat files.txt)
for a in $files
do
	echo "copying $a to ~/$a"
	cp $a ~/$a
done

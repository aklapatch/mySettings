#/bin/sh


files=$(cat files.txt) 
dir=$(dirname "$0")

for a in $files
do
	
	git add $a
done

git add *
git commit -m "automatic upload"
git push origin master

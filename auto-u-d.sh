#!/bin/sh

while :
do
	git remote update
	LOCAL=$(git rev-parse @)
	REMOTE=$(git rev-parse origin/master)
	BASE=$(git merge-base @ origin/master)

	if [ $LOCAL = $REMOTE ]; then
		echo "Up-to-date"
    elif [ $LOCAL = $BASE ]; then
	    git pull origin master

		#add restart nginx
		#add start ngrok
		echo 'updated project'
	fi	
done

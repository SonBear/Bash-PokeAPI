#!/bin/sh

while :
do
	cd /var/www/html
	git remote update
	LOCAL=$(git rev-parse @)
	REMOTE=$(git rev-parse origin/master)
	BASE=$(git merge-base @ origin/master)

	if [ $LOCAL = $REMOTE ]; then
	    echo "Up-to-date"
        elif [ $LOCAL = $BASE ]; then
	    git pull origin master
	    sudo systemctl reload nginx
	    ngrok http 80 --log=stdout >/dev/null &
	    URL=$(curl -sS http://localhost:4040/api/tunnels | jq -r '.tunnels[0].public_url')
	fi	
done

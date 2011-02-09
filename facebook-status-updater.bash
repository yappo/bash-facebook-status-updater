# in your ~/.bashrc
#
#    source ~/git/bash-facebook-status-updater/facebook-status-updater.bash
#    alias facebook="ACCESS_TOKEN='your-facebook-access_token' facebook-status-updater"
#
APP_ID=109938505749078
#ACCESS_TOKEN=""

function facebook-status-updater () {
    if [ "$ACCESS_TOKEN" = "" ]; then
	echo "please set env \$ACCESS_TOKEN using under url"
	echo ""
	echo "open url: https://www.facebook.com/dialog/oauth?client_id="$APP_ID"&redirect_uri=http://www.facebook.com/connect/login_success.html&scope=publish_stream,offline_access&response_type=token"
	echo ""
	echo "use '#access_token=ACCESS_TOKEN&&expires_in=0' in ACCESS_TOKEN strings after accept url"
	return
    fi

    message=$1
    if [ "$message" = "" ]; then
	echo "usage: ACCESS_TOKEN=your-facebook-access_token facebook-status-updater 'message body'"
	return
    fi

    curl -F "access_token=$ACCESS_TOKEN" -F "message=$message" 'https://graph.facebook.com/feed'
    echo ""
}


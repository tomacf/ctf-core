sudo kill -9 $(sudo lsof -i -P -n | grep docker-pr | awk '{print $2}')
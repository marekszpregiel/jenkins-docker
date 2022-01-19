#Generate list of installed plugins in Jenkins  
curl -s "http://<login>:<pass>@localhost:8083/pluginManager/api/json?depth=1" | jq -r '.plugins[] | "\(.shortName):\(.version)"' | sort

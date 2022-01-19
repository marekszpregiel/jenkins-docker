# jenkins-docker  
The repo you are looking at gives you the opportunity to run a custom jenkins in docker.  

**Command to run:**  
docker-compose up -d  

**Command to stop:**  
docker-compose down  

**Command to check logs:**  
docker-compose logs -f  

**Command to login into container:**  
docker exec -it my-jenkins bash  

## First run
During the first run, the initial password will appear in the logs, which should be copied.
This is needed only to unlock Jenkins for the first time.

Next click on the **Install suggested plugins**. This will automatically install the important plugins.

You will see that plugins start downloading.

Now you should create **username** and **password** for login in jenkins.


From now on, jenkins is ready for use. 

Extra commands:
## Command to generate list of installed plugins in Jenkins  
curl -s "http://<login>:<pass>@localhost:8083/pluginManager/api/json?depth=1" | jq -r '.plugins[] | "\(.shortName):\(.version)"' | sort

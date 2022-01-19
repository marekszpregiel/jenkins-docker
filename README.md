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
![alt text](https://github.com/marekszpregiel/jenkins-docker/blob/main/images/initial_password.jpg?raw=true)
  
This is needed only to unlock Jenkins for the first time.  
![alt text](https://github.com/marekszpregiel/jenkins-docker/blob/main/images/unlock_jenkins.jpg?raw=true)
  
Next click on the **Install suggested plugins**. This will automatically install the important plugins.  
![alt text](https://github.com/marekszpregiel/jenkins-docker/blob/main/images/customize_jenkins.jpg?raw=true)
  
You will see that plugins start downloading.  
![alt text](https://github.com/marekszpregiel/jenkins-docker/blob/main/images/getting_started.jpg?raw=true)
  
Now you should create **username** and **password**.  
![alt text](https://github.com/marekszpregiel/jenkins-docker/blob/main/images/create_first_admin_user.jpg?raw=true)
  
![alt text](https://github.com/marekszpregiel/jenkins-docker/blob/main/images/jenkins_url.jpg?raw=true)
  
From now on, jenkins is ready for use.  
![alt text](https://github.com/marekszpregiel/jenkins-docker/blob/main/images/jenkins_dashboard.jpg?raw=true)

# Extra commands:
## Command to generate list of installed plugins in Jenkins  
curl -s "http://login:pass@localhost:8083/pluginManager/api/json?depth=1" | jq -r '.plugins[] | "\(.shortName):\(.version)"' | sort  
where for **login** and **pass** you must provide correct values. 

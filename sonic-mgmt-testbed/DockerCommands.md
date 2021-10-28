# Prerequisites 
* An Ubuntu Linux box
* The sonic docker image in your home directory. 
  * Pre-built sonic-mgmt can also be downloaded from [here](https://sonic-jenkins.westus2.cloudapp.azure.com/job/bldenv/job/docker-sonic-mgmt/lastSuccessfulBuild/artifact/sonic-buildimage/target/docker-sonic-mgmt.gz)
* Basic knowledge of docker commands.
* Docker-tools should be there installed in your system.
# sonic-mgmt docker environment preparation: useful commands (for Ubuntu system)
* Installing docker
    ```
     sudo apt-get update
     sudo apt-get remove docker docker-engine docker.io
     sudo apt install docker.io
     sudo systemctl start docker
     sudo systemctl enable docker
    ```

* Unzip sonic Image
    ```
    gzip -d docker-sonic-mgmt.gz
    ```

* Load the docker Image
   ```
    sudo docker images
    sudo docker load -i docker-sonic-mgmt
    sudo docker run -it --name sonic docker-sonic-mgmt
   ```

* Stopping a docker session
   ```
    sudo docker stop sonic
   ```

* Reconnect to a stopped docker session
    ```
    sudo docker start -i sonic
    ```

* When you are done you may remove the image sonic
    ```
    sudo docker rm sonic
    ```

* Remove docker by image Id
    ```
    sudo docker rmi -f <image-id>
    ```

* Running a sonic docker with local directory mounted in it.
    ```
    sudo docker run -it --name sonic --privileged -v /home/ubuntu/adhar/:/var/johnar/adhar --workdir /var/johnar/adhar --user johnar:gjohnar docker-sonic-mgmt
    ```


# How to run a docker with a port number
* Run a docker container with port number -p
  * -itd will run docker in a detached state, using port 2222 for example you can use any port
   ```
   sudo docker run -itd --name sonic -p 2222:22 docker-sonic-mgmt
   ```

* Enter the docker container using exec
   ```
   sudo docker exec -it sonic bash
   ```

* Check ssh service is running inside the docker
    ```
    johnar@1ed3a9afe70f:~$ service --status-all
    ```

* If ssh service is not running restart ssh service
    ```
    johnar@1ed3a9afe70f:~$ sudo service ssh start
    ```

* Update johnar user passwd, update passwd of your choice
    ```
    johnar@1ed3a9afe70f:~$ sudo passwd johnar
    ```

* Use ssh from any machine in the network to login to docker directly
    ```
    ssh johnar@10.39.71.246 -p 2222
    ```






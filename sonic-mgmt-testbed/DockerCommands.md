# Prerequisites 
* An Ubuntu Linux box
* The sonic docker image in your home directory. 
  * Pre-built sonic-mgmt can also be downloaded from [here](https://sonic-jenkins.westus2.cloudapp.azure.com/job/bldenv/job/docker-sonic-mgmt/lastSuccessfulBuild/artifact/sonic-buildimage/target/docker-sonic-mgmt.gz)
* Basic knowledge of docker commands.
* Docker-tools should be there installed in your system.
# sonic-mgmt docker environment preparation: useful commands (for Ubuntu system)
* Installing docker
    * <code>sudo apt-get update</code>
    * <code>sudo apt-get remove docker docker-engine docker.io</code>
    * <code>sudo apt install docker.io</code>
    * <code>sudo systemctl start docker</code>
    * <code>sudo systemctl enable docker</code>

* Unzip sonic Image
    * <code>gzip -d docker-sonic-mgmt.gz</code>

* Load the docker Image
    * <code>sudo docker images</code>
    * <code>sudo docker load -i docker-sonic-mgmt</code>
    * <code>sudo docker run -it --name sonic docker-sonic-mgmt</code>

* Stopping a docker session
    * <code>sudo docker stop sonic</code>

* Reconnect to a stopped docker session
    * <code>sudo docker start -i sonic</code>

* When you are done you may remove the image sonic
    * <code>sudo docker rm sonic</code>

* Remove docker by image Id
    * <code>sudo docker rmi -f <image-id></code>

* Running a sonic docker with local directory mounted in it.
    * <code>sudo docker run -it --name sonic --privileged -v /home/ubuntu/adhar/:/var/johnar/adhar --workdir /var/johnar/adhar --user johnar:gjohnar docker-sonic-mgmt</code>


# How to run a docker with a port number
* Run a docker container with port number -p
  * -itd will run docker in a detached state, I'm using port 2222 you can use any port
   * <code>sudo docker run -itd --name sonic -p 2222:22 docker-sonic-mgmt</code>

* Enter the docker container using exec
   * <code>sudo docker exec -it sonic bash</code>

* Check ssh service is running inside the docker
    * <code>johnar@1ed3a9afe70f:~$ service --status-all</code>

* If ssh service is not running start ssh
    * <code>johnar@1ed3a9afe70f:~$ sudo service ssh start</code>

* Update johnar user passwd, update passwd of your choice
    * <code>johnar@1ed3a9afe70f:~$ sudo passwd johnar</code>

* Use ssh from any machine in the network to login to docker directly
    * <code>ssh johnar@10.39.71.246 -p 2222</code>






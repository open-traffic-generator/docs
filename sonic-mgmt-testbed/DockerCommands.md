# Prerequisites 
* An Ubuntu Linux box
* The sonic docker image in your home directory. 
  * Pre-built sonic-mgmt can also be downloaded from [here](https://sonic-jenkins.westus2.cloudapp.azure.com/job/bldenv/job/docker-sonic-mgmt/lastSuccessfulBuild/artifact/sonic-buildimage/target/docker-sonic-mgmt.gz)
* Basic knowledge of docker commands.
* Docker-tools should be there installed in your system.
# sonic-mgmt docker environment preparation: useful commands (for Ubuntu system)
* Installing docker<br>
<code>
    * sudo apt-get update
    * sudo apt-get remove docker docker-engine docker.io
    * sudo apt install docker.io
    * sudo systemctl start docker
    * sudo systemctl enable docker
</code><br>
* Unzip sonic Image<br>
<code>
    * gzip -d docker-sonic-mgmt.gz</code>
* Load the docker Image<br>
<code>
    * sudo docker images
    * sudo docker load -i docker-sonic-mgmt
    * sudo docker run -it --name sonic docker-sonic-mgmt</code>
* Stopping a docker session<br>
<code>
    * sudo docker stop sonic</code>
* Reconnect to a stopped docker session<br>
<code>
    * sudo docker start -i sonic</code>
* When you are done you may remove the image sonic<br>
<code>
    * sudo docker rm sonic</code><br>
* Remove docker by image Id<br>
<code>
    * sudo docker rmi -f <image-id></code><br>
* Running a sonic docker with local directory mounted in it.<br>
<code>
    * sudo docker run -it --name sonic --privileged -v /home/ubuntu/adhar/:/var/johnar/adhar --workdir /var/johnar/adhar --user johnar:gjohnar docker-sonic-mgmt</code><br>


# How to run a docker with a port number
* Run a docker container with port number -p
  * -itd will run docker in a detached state, I'm using port 2222 you can use any port
<code>
   * sudo docker run -itd --name sonic -p 2222:22 docker-sonic-mgmt</code>

* Enter the docker container using exec
<code>
   * sudo docker exec -it sonic bash</code>

* Check ssh service is running inside the docker<br>
<code>
    * johnar@1ed3a9afe70f:~$ service --status-all</code>

* If ssh service is not running start ssh<br>
<code>
    * johnar@1ed3a9afe70f:~$ sudo service ssh start</code>

* Update johnar user passwd, update passwd of your choice<br>
<code>
    * johnar@1ed3a9afe70f:~$ sudo passwd johnar</code>

* Use ssh from any machine in the network to login to docker directly<br>
<code>
    * ssh johnar@10.39.71.246 -p 2222<code>






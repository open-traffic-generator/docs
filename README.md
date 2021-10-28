# SONiC Testbed with Keysight IxNetwork as Traffic Generator
Refer the below document to know about Deployment of Keysight ixNetwork API Server Docker  
https://github.com/Azure/sonic-mgmt/blob/master/docs/testbed/README.testbed.Overview.md

# Workflow to run tests with SONiC Testbed with Keysight IxNetwork
Before going to the workflow please take a look at [basic docker commands to create the sonic-mgmt environment](DockerCommands.md).
```sudo docker load -i docker-sonic-mgmt``` 

* Load the sonic-mgmt docker image
  * sudo docker run -it --name sonic docker-sonic-mgmt
* Inside the container clone the forked version of sonic-mgmt(https://github.com/Azure/sonic-mgmt.git)
* Inside the container clone docs repo.(https://github.com/open-traffic-generator/docs.git)
  * update the following files 
      - ptf-ip for ptf(snappi-sonic-ptf) in keysight-testbed/ansible/testbed.csv 
      - ansible_host ips for DUT, Chassis & PTF in keysight-testbed/ansible/snappi-sonic
      - Interface links in keysight-testbed/ansible/files/snappi_sonic_connection_graph.xml
      - links in keysight-testbed/ansible/files/snappi_sonic_link.csv
      - ManagementIp in keysight-testbed/ansible/files/snappi_sonic_devices.csv
      - DUT ansible password in keysight-testbed/ansible/group-vars/snappi-sonic/secrets.yml
* Run the script dev-env.sh from the directory /var/johnar/docs/keysight-testbed, running this script
  update the testbed files needed for the test to run with Keysight ixNetwork
  * cd /var/johnar/docs/keysight-testbed
  * sh ./dev-env.sh
* To Run a single test using pytest
  * cd ~/sonic-mgmt/tests/
  * Add environment variables
    * export ANSIBLE_CONFIG=../ansible
    * export ANSIBLE_LIBRARY=../ansible
  * py.test --inventory ../ansible/snappi-sonic --host-pattern sonic-s6100-dut --testbed vms-snappi-sonic --testbed_file ../ansible/testbed.csv --show-capture=stdout --log-cli-level info --showlocals -ra --allow_recover --skip_sanity --disable_loganalyzer snappi/test_snappi.py
* For Batch runs and nightly tests etc.., please refer to https://github.com/Azure/sonic-mgmt/blob/master/docs/tests/pytest.run.md
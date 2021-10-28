# SONiC Testbed with Keysight IxNetwork as Traffic Generator
https://github.com/Azure/sonic-mgmt/blob/master/docs/testbed/README.testbed.Overview.md

# How to run pytest with SONiC Testbed with Keysight IxNetwork
# Workflow
Before going to the work flow please look into the [basic docker commands to create the sonic-mgmt environment](DockerCommands.md).
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
  replaces the testbed files with keysight ixNetwork testbed
  * cd /var/johnar/docs/keysight-testbed
  * sh ./dev-env.sh
* Run the test
  * cd ~/sonic-mgmt/tests/
  * Add environment variables
    * export ANSIBLE_CONFIG=../ansible
    * export ANSIBLE_LIBRARY=../ansible
  * py.test --inventory ../ansible/snappi-sonic --host-pattern sonic-s6100-dut --testbed vms-snappi-sonic --testbed_file ../ansible/testbed.csv --show-capture=stdout --log-cli-level info --showlocals -ra --allow_recover --skip_sanity --disable_loganalyzer snappi/test_snappi.py

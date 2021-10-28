SCRIPT_DIR=`pwd`
DATE_TIME=`date | sed 's/ //g' | sed 's/://g'`
sudo chown -R johnar:gjohnar ~/sonic-mgmt
#cp -rf ~/sonic-mgmt  ~/sonic-mgmt-bkp-$DATE_TIME
sudo rm -f  ~/sonic-mgmt/ansible/group_vars/all/inv_mapping.yml
sudo rm -f  ~/sonic-mgmt/ansible/group_vars/all/inv_mapping.json
sudo rm -f  ~/sonic-mgmt/ansible/group_vars/lab/lab.yml
sudo rm -f  ~/sonic-mgmt/ansible/testbed.csv
sudo rm -f  ~/sonic-mgmt/ansible/files/snappi_sonic_connection_graph.xml
sudo rm -f  ~/sonic-mgmt/ansible/files/snappi_sonic_devices.csv
sudo rm -f  ~/sonic-mgmt/ansible/files/snappi_sonic_link.csv
sudo rm -rf ~/sonic-mgmt/ansible/group_vars/snappi-sonic/
sudo rm -f  ~/sonic-mgmt/ansible/snappi-sonic

cp -f  $SCRIPT_DIR/ansible/group_vars/all/inv_mapping.yml ~/sonic-mgmt/ansible/group_vars/all/inv_mapping.yml
cp -f  $SCRIPT_DIR/ansible/group_vars/all/inv_mapping.json  ~/sonic-mgmt/ansible/group_vars/all/inv_mapping.json
cp -f  $SCRIPT_DIR/ansible/group_vars/lab/lab.yml ~/sonic-mgmt/ansible/group_vars/lab/lab.yml
cp -f  $SCRIPT_DIR/ansible/testbed.csv ~/sonic-mgmt/ansible/testbed.csv
cp -f  $SCRIPT_DIR/ansible/files/snappi_sonic_connection_graph.xml ~/sonic-mgmt/ansible/files/snappi_sonic_connection_graph.xml
cp -f  $SCRIPT_DIR/ansible/files/snappi_sonic_devices.csv ~/sonic-mgmt/ansible/files/snappi_sonic_devices.csv
cp -f  $SCRIPT_DIR/ansible/files/snappi_sonic_link.csv ~/sonic-mgmt/ansible/files/snappi_sonic_link.csv
cp -rf $SCRIPT_DIR/ansible/group_vars/snappi-sonic/ ~/sonic-mgmt/ansible/group_vars/snappi-sonic/
cp -f  $SCRIPT_DIR/ansible/snappi-sonic ~/sonic-mgmt/ansible/snappi-sonic

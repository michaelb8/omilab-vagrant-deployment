echo "############ Configure / Update OS ############"
# Update Packages
apt-get update
# Upgrade Packages
apt-get upgrade

# Install Git
apt-get install -y git

echo "############ Install MYSQL ############"
# Set MySQL Pass
debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'

# Install MySQL
apt-get install -y mysql-server

echo "############ Install JDK ############"
# Install JDK
sudo apt-get install -y default-jdk

echo "############ Install Tomcat (via package manager) ############"
sudo apt-get install -y tomcat8 tomcat8-admin

# Required folder for the OMiLab environment
cd /var/lib/tomcat8/
sudo mkdir indexes
sudo chown -R tomcat8:tomcat8 indexes/

echo "############ Copy tomcat configuration ############"
# Copy tomcat-users configuration for the usage of tomcat manager
sudo cp /home/vagrant/configs/tomcat-users.xml /etc/tomcat8/tomcat-users.xml
# Increase the memory for the tomcat
sudo cp /home/vagrant/configs/tomcat8 /etc/default/tomcat8

echo "############ Restart tomcat8 ############"
sudo systemctl restart tomcat8

echo "############ Install maven ############"
sudo apt-get install -y maven
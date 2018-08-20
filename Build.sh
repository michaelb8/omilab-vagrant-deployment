echo "############ Create workspace ############"
sudo mkdir /home/vagrant/workspace
cd /home/vagrant/workspace

echo "############ Checkout repositories ############"
git clone https://gitlab.dke.univie.ac.at/omilab-core-infrastructure/PSM.git
git clone https://gitlab.dke.univie.ac.at/omilab-core-infrastructure/ActivityLoggingService.git
git clone https://gitlab.dke.univie.ac.at/omilab-services/DownloadService.git
git clone https://gitlab.dke.univie.ac.at/omilab-core-infrastructure/RoleService.git
git clone https://gitlab.dke.univie.ac.at/omilab-services/TextService.git


echo "############ Overwrite application.properties ############"
# Properties needed different settings, can be solved with an additional profile
cd /home/vagrant/
sudo cp configs/properties/psm/application-distribution.properties workspace/PSM/src/main/resources/config/application-distribution.properties
sudo cp configs/properties/text/application-distribution.properties workspace/TextService/src/main/resources/config/application-rdf1ss.properties
sudo cp configs/properties/download/application-distribution.properties workspace/DownloadService/src/main/resources/config/application-distribution.properties
sudo cp configs/properties/role/application-distribution.properties workspace/RoleService/src/main/resources/config/application-distribution.properties
sudo cp configs/properties/logging/application-distribution.properties workspace/ActivityLoggingService/src/main/resources/config/application-distribution.properties

echo "############ Build binaries ############"
##
cd /home/vagrant/workspace/PSM
sudo mvn -Pdistribution clean package

cd /home/vagrant/workspace/ActivityLoggingService
sudo mvn -Pdistribution clean package

##
cd /home/vagrant/workspace/DownloadService
sudo mvn -Pdistribution clean package

##
cd /home/vagrant/workspace/RoleService
sudo mvn -Pdistribution clean package

##
cd /home/vagrant/workspace/TextService
sudo mvn -Pdistribution clean package

echo "############ Stop tomcat8 ############"
sudo systemctl stop tomcat8

echo "############ Copy binaries ############"
sudo cp /home/vagrant/workspace/PSM/target/*.war /var/lib/tomcat8/webapps/psm.war
sudo cp /home/vagrant/workspace/ActivityLoggingService/target/*.war /var/lib/tomcat8/webapps/logging.war
#sudo cp /home/vagrant/workspace/DownloadService/target/*.war /var/lib/tomcat8/webapps/download.war
sudo cp /home/vagrant/workspace/RoleService/target/*.war /var/lib/tomcat8/webapps/role.war
sudo cp /home/vagrant/workspace/TextService/target/*.war /var/lib/tomcat8/webapps/textservice.war

echo "############ Restart tomcat8 ############"
sudo systemctl start tomcat8
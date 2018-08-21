# Create the databases and content for the OMiLab environment

#psm
echo "############ Create Database for Service PSM (db,user,grants) ############"
mysql -uroot -proot -e "CREATE DATABASE psm;"
mysql -uroot -proot -e "USE psm;"
mysql -uroot -proot "psm" < "/home/vagrant/configs/sql/psm/schema.sql"
mysql -uroot -proot -e "CREATE USER 'psm'@'localhost' IDENTIFIED BY 'password';"
mysql -uroot -proot -e "USE psm;"
mysql -uroot -proot -e "GRANT ALL PRIVILEGES ON psm.* TO 'psm'@'localhost';"

#role
echo "############ Create Database for Service Role (db,user,grants) ############"
mysql -uroot -proot -e "CREATE DATABASE role;"
mysql -uroot -proot -e "USE role;"
mysql -uroot -proot "role" < "/home/vagrant/configs/sql/role/schema.sql"
mysql -uroot -proot -e "CREATE USER 'role'@'localhost' IDENTIFIED BY 'password';"
mysql -uroot -proot -e "USE role;"
mysql -uroot -proot -e "GRANT ALL PRIVILEGES ON role.* TO 'role'@'localhost';"

#logging
echo "############ Create Database for Service logging (db,user,grants) ############"
mysql -uroot -proot -e "CREATE DATABASE logging;"
mysql -uroot -proot -e "USE logging;"
mysql -uroot -proot "logging" < "/home/vagrant/configs/sql/logging/schema.sql"
mysql -uroot -proot -e "CREATE USER 'logging'@'localhost' IDENTIFIED BY 'password';"
mysql -uroot -proot -e "USE logging;"
mysql -uroot -proot -e "GRANT ALL PRIVILEGES ON logging.* TO 'logging'@'localhost';"

#text
echo "############ Create Database for Service Text (db,user,grants) ############"
mysql -uroot -proot -e "CREATE DATABASE text;"
mysql -uroot -proot -e "USE text;"
mysql -uroot -proot "text" < "/home/vagrant/configs/sql/text/schema.sql"
mysql -uroot -proot -e "CREATE USER 'text'@'localhost' IDENTIFIED BY 'password';"
mysql -uroot -proot -e "USE text;"
mysql -uroot -proot -e "GRANT ALL PRIVILEGES ON text.* TO 'text'@'localhost';"

#download
echo "############ Create Database for Service download (db,user,grants) ############"
mysql -uroot -proot -e "CREATE DATABASE download;"
mysql -uroot -proot -e "USE download;"
mysql -uroot -proot "download" < "/home/vagrant/configs/sql/download/schema.sql"
mysql -uroot -proot -e "CREATE USER 'download'@'localhost' IDENTIFIED BY 'password';"
mysql -uroot -proot -e "USE download;"
mysql -uroot -proot -e "GRANT ALL PRIVILEGES ON download.* TO 'download'@'localhost';"

echo "############ Flush Privileges ############"
mysql -uroot -proot -e "FLUSH PRIVILEGES;"
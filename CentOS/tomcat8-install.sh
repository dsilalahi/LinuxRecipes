# ensure java is installed
# if not: sudo yum install java-1.7.0-openjdk java-1.7.0-openjdk-devel
java -version

# get apache tar
cd /opt
wget http://apache.mirrors.lucidnetworks.net/tomcat/tomcat-8/v8.0.11/bin/apache-tomcat-8.0.11.tar.gz

# uncompress tar file
tar xzf apache-tomcat-8.0.11.tar.gz

# set environment variables
echo "export CATALINA_HOME=\"/opt/apache-tomcat-8.0.11\"" >> ~/.bashrc
source ~/.bashrc

# start tomcat service
cd /opt/apache-tomcat-8.0.11/bin
./startup.sh

# verify: http://localhost:8080



# Coviam
Coviam project to install tomcat

Run below command to install tomcat on localhost and deploy sample.war

	ansible-playbook -i localhost tomcatInstall.yml

Run below command and make changes in tomcatInstall.yml to use hosts file to install tomcat and do deployment on server based on environment

       ansible-playbook -i hosts tomcatInstall.yml

Run Below command to use ec2.py to dynamically retrieve the server based on enironment tags.

      ansible-playbook -i ec2.py --private-key=/root/key.pem tomcatInstall.yml
      
RamInfo.sh is a script to get the list of server whose Xmx value is greater than 3/4th value of the Ram.

      sh RamInfo.sh
      
When the ansible-playbook is executed it will install tomcat in the /opt directory and tomcat.service file in /ect/init.d directory,
and the Xms and Xmx value is set dynamically it will set 80% of the Ram value as Xmx. And also it will deploy the sample.war in webapps directory of tomcat.

Location for tomcat service script file is /etc/ansible/tomcatInstall/files/tomcatInitscript.sh
Location for Xmx value setting script is /etc/ansible/tomcatInstall/files/RandomXmxValue.sh

After successfull exection run below url in browser.

     ipaddress:8080/sample

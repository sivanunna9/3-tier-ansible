#!/bin/bash
dir=$(date +"%d-%m-%Y")
export Base=/home/ubuntu/distros/tomcat/apache-tomcat-8.5.57/
#echo "#########stoping tomcat #########"
#bash $Base/bin/shutdown.sh 2>&1 > /dev/null
#pkill -9 -f catalina
echo "###########taking backup of old  war file###########"
mkdir $Base/backups
cd $Base/backups
if [ -d $dir ]
then
    echo "Directory already exists"
else
    mkdir $dir
fi


cd "$(date +"%d-%m-%Y")"
#cp -R /home/ubuntu/distros/apache-tomcat-8.5.57/webapps/*.war .
cp -r ../../webapps/*.war .
echo "#############deleting tomcat logs files#############"
rm -rf $Base/logs/*.log *.out
rm -rf $Base/work
rm -rf $Base/webapps/tendermanagement-0.0.1-SNAPSHOT*
cp -R /home/ubuntu/tendermanagement-0.0.1-SNAPSHOT.war  $Base/webapps
rm -rf /home/ubuntu/tendermanagement-0.0.1-SNAPSHOT.war
#echo "############starting tomcat##################"
#bash $Base/bin/startup.sh 2>&1 > /dev/null



totalRam=$(free -mt | grep Total | awk '{print $2}')
eightyPercentRam=$(echo |awk -v var="$totalRam" 'BEGIN {print var * 0.8}'|cut -d '.' -f 1)

echo "export CATALINA_OPTS=\"\$CATALINA_OPTS -Xms${eightyPercentRam}M -Xmx${eightyPercentRam}M -server -XX:+UseParallelGC\"" > /opt/apache-tomcat-9.0.14/bin/setenv.sh 

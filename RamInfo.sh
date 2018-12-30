for srv in `cat server.txt`
do
    ssh -o "BatchMode yes" $srv 2>/dev/null > output.txt << 'EOF'
    HOSTNAME=$(hostname)
    totalRam=$(free -mt | grep Total | awk '{print $2}')
    threeFourthRam=$(echo |awk -v var="$totalRam" 'BEGIN {print var * 0.75}'|cut -d '.' -f 1)
    xmxValue=$(ps -ef | grep java | awk -F"Xmx" '{print $2}' | awk '{print $1}' | awk -F"M" '{print $1}')
    
    if [ $xmxValue -gt $threeFourthRam ]
    then
    echo "Java Xmx value is greater on $HOSTNAME than 75 percent of the total Ram"
    fi
EOF
done
cat output.txt

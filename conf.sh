#!/bin/sh

DCKRLST=$(docker ps --format "{{.Names}} {{.Ports}}" | grep 1506)
rm web.generated.conf
cp web.template.conf web.generated.conf

counter=0
address=""

for value in ${DCKRLST}; do
    if [ $counter -eq 0 ]
    then 
        name="$(echo ${value} | awk -F '1506-' '{print $2}' | awk -F '_1' '{print $1}' | awk -F '-1' '{print $1}')"  
        echo -e "\tlocation /${name}/ {" >> web.generated.conf
        counter=1
    elif [ $counter -eq 1 ]
    then
        address="$(echo ${value} | awk -F '-' '{print $1}' | awk -F ':' '{print $2}')"   
        echo -e "\t\tproxy_pass http://localhost:${address}/;\n\t}\n" >> web.generated.conf
        counter=2
    else
        counter=0
    fi
done
echo "}" >> web.generated.conf

cp web.generated.conf /etc/nginx/conf.d/.
systemctl stop nginx
systemctl start nginx
nginx -s reload

#!/bin/bash
echo "==========> Running Backup Program <=========="

#create directory to save backup file
mkdir -p /home/move

#Backup directory /etc/passwd to /home/move/passwd.mig
awk -v LIMIT=1001 -F: '($3>=1001) && ($3!=65534)' /etc/passwd > /home/move/passwd.mig

#Backup directory /etc/group to /home/move/group.mig
awk -v LIMIT=1001 -F: '($3>=1001) && ($3!=65534)' /etc/group > /home/move/group.mig

#Backup directory /etc/shadow to /home/move/shadow.mig
awk -v LIMIT=1001 -F: '($3>=1001) && ($3!=65534) {print $1}' /etc/passwd | tee - |egrep -f - /etc/shadow > /home/move/shadow.mig

#Backup directory /etc/gshadow to /home/move/gshadow.mig
awk -v LIMIT=1001 -F: '($3>=1001) && ($3!=65534) {print $1}' /etc/passwd | tee - |egrep -f - /etc/gshadow > /home/move/gshadow.mig

#Backup directory /home
tar -zcvpf /home/move/home.tar.gz /home

echo "==========> Program run successfully!! <=========="


#!/bin/bash
echo "==========> Running Migration Program <=========="

#Create directory to save backup file"
mkdir -p /root/backup

#Backup directory user management to /root/backup
cp /etc/passwd /etc/shadow /etc/group /etc/gshadow /root/backup

#Create directory to save migration file
mkdir -p /home/iswari/migration

#Copy file from primary server
rsync -av gerda@192.168.204.139:/home/move/* /home/iswari/migration

#change to directory which contain file to migration 
cd /home/iswari/migration

#Migration /etc/passwd file
cat passwd.mig >> /etc/passwd

#Migration /etc/group file
cat group.mig >> /etc/group

#Migration /etc/shadow file
cat shadow.mig >> /etc/shadow

#Migration /etc/gshadow file
cat gshadow.mig >> /etc/gshadow

# Migration /homedir to root(/) directory
cd / 
tar -zxvf /home/iswari/migration/home.tar.gz

echo "==========> Program run successfully!! <=========="

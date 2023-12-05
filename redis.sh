echo -e "\e[36m>>>> INSTALL REDIS REPOS <<<<\e[0m"
dnf install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y

echo -e "\e[36m>>>> INSTALL REDIS <<<<\e[0m"
dnf module enable redis:remi-6.2 -y

echo -e "\e[36m>>>> INSTALL REDIS REPOS <<<<\e[0m"
dnf install redis -y

echo -e "\e[36m>>>> update redis listen address <<<<\e[0m"
sed -i -e 's|127.0.0.1|0.0.0.0|' /etc/redis.conf /etc/redis/redis.conf

echo -e "\e[36m>>>> start redis service <<<<\e[0m"
systemctl enable redis

systemctl start redis
//Install DNS Server

apt-get install -y bind9 bind9utils bind9-doc dnsutils

//Configure DNS Server

 ///etc/bind/ is the configuration directory of bind9, holds configuration files and zone lookup files. Global configuration file is /etc/bind/named.conf.

//Create Zone’s

//You should not use the global configuration file for local DNS zone rather you can use /etc/bind/named.conf.local file.

nano /etc/bind/named.conf.local

/etc/bind/db.local 

//Forward Zone

zone "xxxx.local" IN { //Domain name
     type master; //Primary DNS
     file "/etc/bind/fwd.itzgeek.local.db"; //Forward lookup file
     allow-update { none; }; // Since this is the primary DNS, it should be none.
};

//Reverse Zone


zone "0.0.0.in-addr.arpa" IN { //Reverse lookup name, should match your network in reverse order
     type master; // Primary DNS
     file "/etc/bind/rev.itzgeek.local.db"; //Reverse lookup file
     allow-update { none; }; //Since this is the primary DNS, it should be none.
};

//Create Zone lookup file

cp /etc/bind/db.local /etc/bind/fwd.xxxx.local.db

//Edit the zone.

nano /etc/bind/fwd.xxxxx.local.db

//Reverse Zone lookup file

cp /etc/bind/db.127 /etc/bind/rev.xxxxx.local.db

nano /etc/bind/rev.xxxxx.local.db


//Check BIND Configuration Syntax
//Use named-checkconf command to check the syntax of named.conf* files for any errors.

named-checkconf

//Also, you can use named-checkzone to check the syntax errors in zone files.

//For foward zone

named-checkzone itzgeek.local /etc/bind/fwd.xxxxx.local.db

//For reverse zone

named-checkzone 0.0.0.in-addr.arpa /etc/bind/rev.xxxx.local.db

//Restart bind service.

systemctl restart bind9

//Enable it on system startup.

systemctl enable bind9

//Check the status of bind9 service.

systemctl status bind9

//Verify DNS

nano /etc/resolv.conf

nameserver 0.0.0.0

//Use the dig command to verify the forward lookup.

dig www.xxxx.local

//Confirm the reverse lookup with dig command.

dig -x 0.0.0.0


netstat -tulpn | grep :53


sudo apt-get install iptables-persistent

//Open up the file /etc/iptables/rules.v4 using any editor,

nano /etc/iptables/rules.v4,

//Start or restart iptables-persistent service.

service iptables-persistent restart

//Now check port 53 is open or not using command:

iptables -L -n


//Test Master DNS Server

//Edit file /etc/resolv.conf,

nano /etc/resolv.conf

//And add your Master DNS server details,

search unixmen.local
nameserver 0.0.0.0

//Reboot the system or restart the networking service.

service networking restart

//Now let us check Master DNS server is working or not using the following commands:

dig master.xxxxx.local

dig -x master.xxxx.local

dig xxxxx.local

dig -x xxxx.local

nslookup xxxxx.local

host xxxx.local

host master.xxxx.local




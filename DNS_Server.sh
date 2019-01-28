//Install DNS Server

apt-get install -y bind9 bind9utils bind9-doc dnsutils

//Configure DNS Server
/***
/etc/bind/ is the configuration directory of bind9, holds configuration files and zone lookup files. Global configuration file is /etc/bind/named.conf. ***/
//Create Zone’s
//You should not use the global configuration file for local DNS zone rather you can use /etc/bind/named.conf.local file.

nano /etc/bind/named.conf.local

//Forward Zone
zone "xxxx.local" IN { //Domain name
     type master; //Primary DNS
     file "/etc/bind/fwd.itzgeek.local.db"; //Forward lookup file
     allow-update { none; }; // Since this is the primary DNS, it should be none.
};

Reverse Zone


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
named-checkzone 1.168.192.in-addr.arpa /etc/bind/rev.xxxx.local.db


//Restart bind service.
systemctl restart bind9
//Enable it on system startup.
systemctl enable bind9
//Check the status of bind9 service.
systemctl status bind9

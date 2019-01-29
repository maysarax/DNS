
#edit file /etc/resolv.conf

sudo nano /etc/resolv.conf


#Test DNS Server

#Run the following command to test Primary DNS server.

dig master.xxxxx.local

#Check Secondary server using command:

dig slave.xxxx.local

#!/bin/sh

FROM="jozef.zuzelka@gmail.com"
AUTH="jozef.zuzelka@gmail.com"
PASS="whngqcopejsnqmoz"
FROMNAME="Asus RT-AC66U (Merlin)"
TO="jozef.zuzelka@gmail.com v.zuzelka@gmail.com"

ntpclient -h pool.ntp.org -s &> /dev/null
sleep 5

time=$(echo $(date +"%c"))

message=$(echo "<b>Connected:</b> $time_ascii<br><b>Real Address:</b> \
$untrusted_ip<br><b>Virtual Address:</b> \
$ifconfig_pool_remote_ip<br><b>Common \
Name:</b> $username<br><br>")

echo "Subject: OpenVPN CONNECT" >/tmp/mail.txt
echo "Content-Type: text/html" >>/tmp/mail.txt
echo "From: $FROMNAME<$FROM>" >>/tmp/mail.txt
echo "Date: `date -R`" >>/tmp/mail.txt
echo "" >>/tmp/mail.txt
echo "Client has connected to <b>OpenVPN</b>:<br>" >>/tmp/mail.txt
echo "" >>/tmp/mail.txt
echo "<br>$message" >>/tmp/mail.txt
echo "" >>/tmp/mail.txt
echo "---<br>" >>/tmp/mail.txt
echo "Your friendly router." >>/tmp/mail.txt
echo "<br>" >>/tmp/mail.txt

cat /tmp/mail.txt | sendmail -H"exec openssl s_client -quiet \
-CAfile /jffs/configs/Equifax_Secure_Certificate_Authority.pem \
-connect smtp.gmail.com:587 -tls1 -starttls smtp" \
-f"$FROM" \
-au"$AUTH" -ap"$PASS" $TO 

rm /tmp/mail.txt

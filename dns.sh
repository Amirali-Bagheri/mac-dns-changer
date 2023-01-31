#!/usr/bin/env sh

RED='\033[91m'
GREEN='\033[92m'
GREEN_solid='\033[42m'
CYAN='\033[96m'
NC='\033[0m'

DNScheck()
{
  echo "--------------------------------------------------------------------"
  echo "${CYAN}[!]${NC}Checking DNS resolution:"
  dig google.com +noall +answer +stats | awk '$3 == "IN" && $4 == "A"{ip=$5}/Query time:/{t=$4 " " $5}/SERVER:/{serv=$3} END{print "\nIP (Google):"ip, "\nTime: "t, "\nDNS server: "serv}'
  echo "--------------------------------------------------------------------"
}

echo "${GREEN_solid}\nChoose an option to change your DNS server:${NC}\c"

printf '
1. Shecan             2. Electro
3. Server.ir          4. Radar Game
5. DNSPro.ir          6. Begzar  
10. Cloudflare        11. Open DNS
12. Google            13. Quad
14. PiHole            15. UncensoredDNS     
16. CZ_NIC            17. Level 3           
18. Comodo Secure     19. Control D         
20. Altarnative       21. Versign           
22. Open Nic          23. Yandex            
24. Dns Watch         25. Oracle Dyn        
26. Freenom World     27. Flash Start
0. Custom DNS         
100. Test DNS         101. Reset DNS
Enter: ';

read var;

echo "--------------------------------------------------------------------"

# Shecan
if [ "$var" -eq "1" ]; then
	networksetup -setdnsservers Wi-Fi 178.22.122.100 185.51.200.2
	echo "[✓]${GREEN}Shecan set as DNS server.${NC} Checking..."
fi

# Electro
if [ "$var" -eq "2" ]; then
	networksetup -setdnsservers Wi-Fi 78.157.42.100 78.157.42.101
	echo "[✓]${GREEN}Electro set as DNS server.${NC} Checking..."
fi

# Server.ir
if [ "$var" -eq "3" ]; then
	networksetup -setdnsservers Wi-Fi 194.104.158.48 194.104.158.78
	echo "[✓]${GREEN}Server.ir set as DNS server.${NC} Checking..."
fi

# Radar Game
if [ "$var" -eq "4" ]; then
	networksetup -setdnsservers Wi-Fi 10.202.10.10 10.202.10.11
	echo "[✓]${GREEN}Radar Game set as DNS server.${NC} Checking..."
fi

# DNS Pro
if [ "$var" -eq "5" ]; then
	networksetup -setdnsservers Wi-Fi 185.105.236.236 185.105.238.238
	echo "[✓]${GREEN}DNS Pro set as DNS server.${NC} Checking..."
fi

# Begzar
if [ "$var" -eq "6" ]; then
	networksetup -setdnsservers Wi-Fi 185.55.226.26 185.55.225.25
	echo "[✓]${GREEN}Begzar set as DNS server.${NC} Checking..."
fi

# Host Iran
if [ "$var" -eq "7" ]; then
	networksetup -setdnsservers Wi-Fi 172.29.0.100 172.29.2.100
	echo "[✓]${GREEN}Host Iran set as DNS server.${NC} Checking..."
fi


# Cloudflare
if [ "$var" -eq "10" ]; then
	networksetup -setdnsservers Wi-Fi 1.1.1.1 1.0.0.1 2606:4700:4700::1111 2606:4700:4700::1001
	echo "[✓]${GREEN}Cloudflare set as DNS server.${NC} Checking..."
fi

# Open DNS
if [ "$var" -eq "11" ]; then
	networksetup -setdnsservers Wi-Fi 208.67.222.222 208.67.220.220 2620:119:35::35 2620:119:53::53
	echo "[✓]${GREEN}Open DNS set as DNS server.${NC} Checking..."
fi

# Google
if [ "$var" -eq "12" ]; then
	networksetup -setdnsservers Wi-Fi 8.8.8.8 8.8.4.4 2001:4860:4860::8888 2001:4860:4860::8844
	echo "[✓]${GREEN}Google DNS set as DNS server.${NC} Checking..."
fi

# Quad9
if [ "$var" -eq "13" ]; then
	networksetup -setdnsservers Wi-Fi 9.9.9.9 149.112.112.112 2620:fe::fe 2620:fe::9
	echo "[✓]${GREEN}PiHole set as DNS server.${NC} Checking..."
fi

# PiHole
if [ "$var" -eq "14" ]; then
	networksetup -setdnsservers Wi-Fi 192.168.100.27 fd5c:c307:7993:db00:2e0:4cff:fe6b:1f4
	echo "[✓]${GREEN}PiHole set as DNS server.${NC} Checking..."
fi

if [ "$var" -eq "15" ]; then
	networksetup -setdnsservers Wi-Fi 91.239.100.100 89.233.43.71
	echo "[✓]${GREEN}UncensoredDNS set as DNS server.${NC} Checking..." 
fi

# CZ-NIC
if [ "$var" -eq "16" ]; then
	networksetup -setdnsservers Wi-Fi 193.17.47.1 185.43.135.1
	echo "[✓]${GREEN}CZ-NIC DNS set as DNS server.${NC} Checking..." 
fi

# Level 3
if [ "$var" -eq "17" ]; then
	networksetup -setdnsservers Wi-Fi 209.244.0.3 209.244.0.4
	echo "[✓]${GREEN}Level 3 DNS set as DNS server.${NC} Checking..." 
fi

# Comodo Secure
if [ "$var" -eq "18" ]; then
	networksetup -setdnsservers Wi-Fi 8.26.56.26 8.20.247.20
	echo "[✓]${GREEN}Comodo Secure DNS set as DNS server.${NC} Checking..." 
fi

# Control D
if [ "$var" -eq "19" ]; then
	networksetup -setdnsservers Wi-Fi 76.76.2.0 76.76.10.0 2606:1a40:: 2606:1a40:1::
	echo "[✓]${GREEN}Control D DNS set as DNS server.${NC} Checking..." 
fi

# Altarnative
if [ "$var" -eq "20" ]; then
	networksetup -setdnsservers Wi-Fi 76.76.19.19 76.223.122.150 2602:fcbc::ad 2602:fcbc:2::ad
	echo "[✓]${GREEN}Altarnative DNS set as DNS server.${NC} Checking..." 
fi

# Versign
if [ "$var" -eq "21" ]; then
	networksetup -setdnsservers Wi-Fi 64.6.64.6 64.6.65.6
	echo "[✓]${GREEN}Versign DNS set as DNS server.${NC} Checking..." 
fi

# Open Nic
if [ "$var" -eq "22" ]; then
	networksetup -setdnsservers Wi-Fi 216.87.84.211 23.90.4.6
	echo "[✓]${GREEN}Open Nic DNS set as DNS server.${NC} Checking..." 
fi

# Yandex
if [ "$var" -eq "23" ]; then
	networksetup -setdnsservers Wi-Fi 77.88.8.8 77.88.8.1
	echo "[✓]${GREEN}Yandex DNS set as DNS server.${NC} Checking..." 
fi

# Dns Watch
if [ "$var" -eq "24" ]; then
	networksetup -setdnsservers Wi-Fi 84.200.69.80 84.200.70.40
	echo "[✓]${GREEN}Dns Watch set as DNS server.${NC} Checking..." 
fi

# Oracle Dyn
if [ "$var" -eq "25" ]; then
	networksetup -setdnsservers Wi-Fi 216.146.35.35 216.146.36.36
	echo "[✓]${GREEN}Oracle Dyn set as DNS server.${NC} Checking..." 
fi

# Freenom World
if [ "$var" -eq "26" ]; then
	networksetup -setdnsservers Wi-Fi 80.80.80.80 80.80.81.81
	echo "[✓]${GREEN}Freenom set as DNS server.${NC} Checking..." 
fi

# Flash Start
if [ "$var" -eq "27" ]; then
	networksetup -setdnsservers Wi-Fi 185.236.104.104 185.236.105.105
	echo "[✓]${GREEN}Flash Start set as DNS server.${NC} Checking..." 
fi

# Custom
if [ "$var" -eq "0" ]; then
	printf 'Enter a desired DNS server: '
	read DNS;
	networksetup -setdnsservers Wi-Fi $DNS
	echo "[✓]${GREEN}$DNS set as DNS server.${NC} Checking..."
fi

echo "--------------------------------------------------------------------"

echo "Current DNS server: ${CYAN}$(networksetup -getdnsservers Wi-Fi)${NC}"
DNScheck

# Test DNS
if [ "$var" -eq "100" ]; then
	echo "--------------------------------------------------------------------"
	dig google.com
	ping 8.8.8.8 -c 4
	echo "--------------------------------------------------------------------"
fi

# Reset DNS
if [ "$var" -eq "101" ]; then
	echo "[✓]${RED}Removing${NC} these DNS servers:\n${CYAN}$(networksetup -getdnsservers Wi-Fi)${NC}"
	sleep 0.5
	networksetup -setdnsservers Wi-Fi empty
	echo "${RED}[!]${NC}DNS servers are reset to your DHCP."
	DNScheck
fi


sudo -k # signs out of root

#!/usr/bin/env sh

# Define colors
RED='\033[91m'
GREEN='\033[92m'
GREEN_solid='\033[42m'
CYAN='\033[96m'
NC='\033[0m'

# Display options
echo "${GREEN_solid}\nChoose an option to change your DNS server:${NC}\c"

# Define DNS servers array
dns_servers=(
    '{"number":1, "title":"Shecan", "dns":"178.22.122.100 185.51.200.2"}'
    '{"number":2, "title":"403.online", "dns":"10.202.10.202 10.202.10.102"}'
    '{"number":3, "title":"Electro", "dns":"78.157.42.100 78.157.42.101"}'
    '{"number":4, "title":"Radar Game", "dns":"10.202.10.10 10.202.10.11"}'
    '{"number":5, "title":"Server.ir", "dns":"194.104.158.48 194.104.158.78"}'
    '{"number":6, "title":"Host Iran", "dns":"172.29.0.100 172.29.2.100"}'
    '{"number":7, "title":"DNSPro.ir", "dns":"185.105.236.236 185.105.238.238"}'
    '{"number":8, "title":"Begzar", "dns":"185.55.226.26 185.55.225.25"}'
    '{"number":9, "title":"Shatel", "dns":"85.15.1.15 85.15.1.14"}'
    '{"number":10, "title":"Asia Tech", "dns":"194.36.174.161 178.22.122.100"}'
    '{"number":11, "title":"Pars Online", "dns":"91.99.101.12"}'
    '{"number":12, "title":"Pishgaman", "dns":"5.202.100.101"}'
    '{"number":13, "title":"Resaneh Pardaz", "dns":"185.186.242.161"}'
    '{"number":20, "title":"Cloudflare", "dns":"1.1.1.1 1.0.0.1 2606:4700:4700::1111 2606:4700:4700::1001"}'
    '{"number":21, "title":"Open DNS", "dns":"208.67.222.222 208.67.220.220 2620:119:35::35 2620:119:53::53"}'
    '{"number":22, "title":"Google", "dns":"8.8.8.8 8.8.4.4 2001:4860:4860::8888 2001:4860:4860::8844"}'
    '{"number":23, "title":"Quad9", "dns":"9.9.9.9 149.112.112.112 2620:fe::fe 2620:fe::9"}'
    '{"number":24, "title":"PiHole", "dns":"192.168.100.27 fd5c:c307:7993:db00:2e0:4cff:fe6b:1f4"}'
    '{"number":25, "title":"Some DNS", "dns":"91.239.100.100 89.233.43.71"}'
    '{"number":26, "title":"CZ_NIC", "dns":"193.17.47.1 185.43.135.1"}'
    '{"number":27, "title":"Level 3", "dns":"209.244.0.3 209.244.0.4"}'
    '{"number":28, "title":"Comodo Group", "dns":"8.26.56.26 8.20.247.20"}'
    '{"number":29, "title":"Control D", "dns":"76.76.2.0 76.76.10.0 2606:1a40:: 2606:1a40:1::"}'
    '{"number":30, "title":"Alternative", "dns":"76.76.19.19 76.223.122.150 2602:fcbc::ad 2602:fcbc:2::ad"}'
    '{"number":31, "title":"Versign", "dns":"64.6.64.6 64.6.65.6"}'
    '{"number":32, "title":"Open Nic", "dns":"216.87.84.211 23.90.4.6"}'
    '{"number":33, "title":"Yandex", "dns":"77.88.8.8 77.88.8.1"}'
    '{"number":34, "title":"Dns Watch", "dns":"84.200.69.80 84.200.70.40"}'
    '{"number":35, "title":"Oracle Dyn", "dns":"216.146.35.35 216.146.36.36"}'
    '{"number":36, "title":"Freenom World", "dns":"80.80.80.80 80.80.81.81"}'
    '{"number":37, "title":"Flash Start", "dns":"185.236.104.104 185.236.105.105"}'
    '{"number":38, "title":"Neustar DNS", "dns":"156.154.70.5 156.154.71.5"}'
    '{"number":39, "title":"DYN", "dns":"216.146.35.35 216.146.36.36"}'
)

# Print newline
printf "\n"
count=0

# Loop through DNS servers array and display options
for dns_server in "${dns_servers[@]}"; do
    ((count++)) # Increment count

    # Parse JSON string and extract fields
    number=$(jq -r '.number' <<< "$dns_server")
    title=$(jq -r '.title' <<< "$dns_server")

    # Output the fields with space between objects
    printf "$number. $title"

    # Add newline every 3 items to break into a new row
    if ((count % 3 == 0)); then
        printf "\n"
    else
        printf "%-20s" "" # Add spacing between two items
    fi
done

# Display custom and reset options
printf '0. Custom DNS           101. Reset DNS\n\nEnter Number: '
read dns_choose

# Get selected DNS
dns=$(jq -r '.dns' <<< "${dns_servers[$((dns_choose-1))]}")

echo "--------------------------------------------------------------------"

# Custom DNS
if [ "$dns_choose" -eq "0" ]; then
    printf 'Enter a desired DNS server: '
    read DNS
    networksetup -setdnsservers Wi-Fi $DNS
fi

echo "[✓] ${RED}Setting up DNS...${NC}"

# Check if var is set and within range
if [[ -n $dns_choose && ${dns_servers[$dns_choose]+exists} ]]; then
    # Set DNS servers
    networksetup -setdnsservers Wi-Fi $dns
else
    echo "Invalid selection or variable is not set."
fi

echo "[✓] ${GREEN}DNS Setup Done. ${NC}"

# Reset DNS
if [ "$dns_choose" -eq "101" ]; then
    echo "[✓] ${RED}Removing${NC} these DNS servers:\n${CYAN}$(networksetup -getdnsservers Wi-Fi)${NC}"
    sleep 0.5
    networksetup -setdnsservers Wi-Fi empty
    echo "${RED}[!]${NC} DNS servers are reset to your DHCP."
fi

sudo -k # Signs out of root
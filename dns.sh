#!/usr/bin/env bash

# Define colors
GREEN='\033[92m'
NC='\033[0m'

# Display options
printf "${GREEN}\nChoose an option to change your DNS server:${NC}"


# Define DNS servers array
dns_servers=(
  "1|Shecan|178.22.122.100 185.51.200.2"
  "2|403.online|10.202.10.202 10.202.10.102"
  "3|Electro|78.157.42.100 78.157.42.101"
  "4|Radar Game|10.202.10.10 10.202.10.11"
  "5|Server.ir|194.104.158.48 194.104.158.78"
  "6|Host Iran|172.29.0.100 172.29.2.100"
  "7|DNSPro.ir|185.105.236.236 185.105.238.238"
  "8|Begzar|185.55.226.26 185.55.225.25"
  "9|Shatel|85.15.1.15 85.15.1.14"
  "10|Asia Tech|194.36.174.161 178.22.122.100"
  "11|Pars Online|91.99.101.12"
  "12|Pishgaman|5.202.100.101"
  "13|Resaneh Pardaz|185.186.242.161"
  "20|Cloudflare|1.1.1.1 1.0.0.1"
  "21|Open DNS|208.67.222.222 208.67.220.220"
  "22|Google|8.8.8.8 8.8.4.4"
  "23|Quad9|9.9.9.9 149.112.112.112"
  "24|Some DNS|91.239.100.100 89.233.43.71"
  "25|CZ_NIC|193.17.47.1 185.43.135.1"
  "26|Level 3|209.244.0.3 209.244.0.4"
  "27|Comodo Group|8.26.56.26 8.20.247.20"
  "28|Control D|76.76.2.0 76.76.10.0"
  "29|Alternative|76.76.19.19 76.223.122.150"
  "30|Versign|64.6.64.6 64.6.65.6"
  "31|Open Nic|216.87.84.211 23.90.4.6"
  "32|Yandex|77.88.8.8 77.88.8.1"
  "33|Dns Watch|84.200.69.80 84.200.70.40"
  "34|Oracle Dyn|216.146.35.35 216.146.36.36"
  "35|Freenom World|80.80.80.80 80.80.81.81"
  "36|Flash Start|185.236.104.104 185.236.105.105"
  "37|Neustar DNS|156.154.70.5 156.154.71.5"
  "38|DYN|216.146.35.35 216.146.36.36"
)

# Function to print formatted options
print_options() {
    for dns_server in "${dns_servers[@]}"; do
        IFS='|' read -r number title dns_list <<< "$dns_server"
        echo "$number) $title ($dns_list)"
    done
}

# Function to calculate average ping time for a given DNS server
get_average_ping() {
    local dns=$1
    avg=$(ping -c 4 -q "$dns" | tail -1 | awk -F'/' '{print $5}')
    if [ -z "$avg" ]; then
        echo "9999"
    else
        echo "$avg"
    fi
}

# Check if an argument was provided and set selection accordingly
if [ $# -gt 0 ]; then
    selection=$1
else
    read -p "

1) Find Best Server (Auto) for 403 Unlock
2) Show List (Manual Choose)
3) Find Best Server (Auto) for All DNS Servers
4) Reset DNS
5) Check Current DNS
6) Feedback

Enter your choice: " selection
fi

if [ "$selection" == "1" ]; then
    clear
   # Auto: Calculate ping for selected DNS servers and select the best one

   selected_servers=("Shecan" "403.online" "Google" "Cloudflare")
   echo "Calculating ping for 403 Unlockers DNS servers..."
   printf '\n'

   pings=()
   server_dns_map=()

   for dns_server in "${dns_servers[@]}"; do
       IFS='|' read -r number title dns_list <<< "$dns_server"
       if [[ " ${selected_servers[*]} " =~ $title ]]; then
           IFS=' ' read -r -a dns_array <<< "$dns_list"

           dns_pings=()

           for dns in "${dns_array[@]}"; do
               ping=$(get_average_ping "$dns")
               if [ "$ping" != "9999" ]; then
                   dns_pings+=("$ping ms")
                   pings+=("$ping|$dns|$title")
               fi
           done

           # Store the DNS list for this server
           server_dns_map+=("$title|$dns_list")

           # Construct the final output with all pings
           pings_str=$(IFS=', ' ; echo "${dns_pings[*]}")

           echo "$title, Pings: ($pings_str)"
       fi
   done

   # Determine the best DNS server by the lowest ping
   if [ "${#pings[@]}" -gt 0 ]; then
       best_ping_info=$(printf "%s\n" "${pings[@]}" | sort -n | head -n 1)
       best_ping=$(echo "$best_ping_info" | cut -d'|' -f1)
       best_dns=$(echo "$best_ping_info" | cut -d'|' -f2)
       best_server=$(echo "$best_ping_info" | cut -d'|' -f3)

       printf '\n'

       echo "Best DNS server by lowest ping: $best_server with ping $best_ping ms"

       # Find the DNS list for the best server
       for server_dns in "${server_dns_map[@]}"; do
           IFS='|' read -r server title_dns_list <<< "$server_dns"
           if [ "$server" == "$best_server" ]; then
               best_dns_list="$title_dns_list"
               break
           fi
       done

       printf '\n'

       echo "Setting DNS servers to: $best_dns_list..."

       # Set the DNS servers using networksetup
       networksetup -setdnsservers Wi-Fi $best_dns_list
   else
       echo "No valid pings found."
   fi


    exit

elif [ "$selection" == "2" ]; then
    printf "\n\n${GREEN}Choose an option to change your DNS server:\n\n${NC}"
    print_options
    printf '\n(0) Custom DNS \n\n'
    read -p "Enter the number corresponding to your choice: " dns_choose

    if [ "$dns_choose" -eq "0" ]; then
        read -p "Enter the desired DNS server: " custom_dns
        dns="$custom_dns"
    else
        dns=$(echo "${dns_servers[$((dns_choose-1))]}" | cut -d'|' -f3)
    fi

    echo "Setting DNS servers..."
    networksetup -setdnsservers Wi-Fi $dns
    printf "\n\n${GREEN}DNS Setup Done.\n${NC}"

    exit

elif [ "$selection" == "3" ]; then
    echo "Calculating ping for all DNS servers..."

    pings=()
       server_dns_map=()

       for dns_server in "${dns_servers[@]}"; do
           IFS='|' read -r number title dns_list <<< "$dns_server"
                          IFS=' ' read -r -a dns_array <<< "$dns_list"

                          dns_pings=()

                          for dns in "${dns_array[@]}"; do
                              ping=$(get_average_ping "$dns")
                              if [ "$ping" != "9999" ]; then
                                  dns_pings+=("$ping ms")
                                  pings+=("$ping|$dns|$title")
                              fi
                          done

                          # Store the DNS list for this server
                          server_dns_map+=("$title|$dns_list")

                          # Construct the final output with all pings
                          pings_str=$(IFS=', ' ; echo "${dns_pings[*]}")

                          echo "$title, Pings: ($pings_str)"
       done

       # Determine the best DNS server by the lowest ping
       if [ "${#pings[@]}" -gt 0 ]; then
           best_ping_info=$(printf "%s\n" "${pings[@]}" | sort -n | head -n 1)
           best_ping=$(echo "$best_ping_info" | cut -d'|' -f1)
           best_dns=$(echo "$best_ping_info" | cut -d'|' -f2)
           best_server=$(echo "$best_ping_info" | cut -d'|' -f3)

           printf '\n'

           echo "Best DNS server by lowest ping: $best_server with ping $best_ping ms"

           # Find the DNS list for the best server
           for server_dns in "${server_dns_map[@]}"; do
               IFS='|' read -r server title_dns_list <<< "$server_dns"
               if [ "$server" == "$best_server" ]; then
                   best_dns_list="$title_dns_list"
                   break
               fi
           done

           printf '\n'

           echo "Setting DNS servers to: $best_dns_list..."

           # Set the DNS servers using networksetup
           networksetup -setdnsservers Wi-Fi $best_dns_list
       else
           echo "No valid pings found."
       fi
    exit

elif [ "$selection" == "4" ]; then
    echo "Resetting DNS..."
    networksetup -setdnsservers Wi-Fi empty
    echo "DNS servers are reset."
    exit

elif [ "$selection" == "5" ]; then
    echo "Current DNS servers:"
    networksetup -getdnsservers Wi-Fi
    exit

elif [ "$selection" == "6" ]; then
    echo "Contact me:"
    echo "Email: bagheriamirali2000@gmail.com"
    echo "GitHub: amirali-bagheri"
    exit

else
    echo "Invalid selection. Exiting..."
    exit 1
fi

echo "[✓] ${GREEN}DNS Setup Done. ${NC}"
sudo -k # Signs out of root

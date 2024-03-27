# MacOS DNS Changer (Supported Iranian DNS)

This shell script enables setting DNS servers for WiFi (WLAN interface) on MacOS devices. It provides options for both Iranian and global DNS servers.

## Iranian DNS Servers:
1. [Shecan](https://shecan.ir)
2. [Electro](https://electrotm.org/)
3. [Radar Game](https://radar.game/)
4. [DNS Pro](https://dnspro.ir/)
5. [Begzar](https://begzar.ir/)
6. [403.online](https://403.online)
7. [Server.ir](https://server.ir)
8. Host Iran
9. Shatel
10. Asia Tech
11. Pars Online
12. Pishgaman
13. Resaneh Pardaz

## Global DNS Servers:
1. [Cloudflare](https://www.cloudflare.com/)
2. [Open DNS](https://www.opendns.com/)
3. [Google](https://google.com)
4. [Pihole](https://pi-hole.net)
5. [UncensoredDNS](https://blog.uncensoreddns.org)
6. CZ_NIC
7. Level 3
8. Comodo Group
9. Control D
10. Altarnative
11. Versign
12. Open Nic
13. Yandex
14. DNS Watch
15. Oracle Dyn
16. Freenom World
17. Flash Start
18. Quad9
19. Some DNS
20. Neustar DNS

## Usage:


### Download and Run Script from GitHub Repository

You can easily download and execute the `dns.sh` script from the GitHub repository using either `curl` or `wget`.

#### Using curl:

```bash
curl -O https://raw.githubusercontent.com/Amirali-Bagheri/mac-dns-changer/main/dns.sh && chmod +x dns.sh && ./dns.sh
```

- `curl -O https://raw.githubusercontent.com/Amirali-Bagheri/mac-dns-changer/main/dns.sh`: Downloads the `dns.sh` script from the specified URL and saves it with the same name in the current directory.
- `chmod +x dns.sh`: Changes the permissions of the downloaded script to make it executable.
- `./dns.sh`: Executes the downloaded script.

#### Using wget:

```bash
wget https://raw.githubusercontent.com/Amirali-Bagheri/mac-dns-changer/main/dns.sh && chmod +x dns.sh && ./dns.sh
```

- `wget https://raw.githubusercontent.com/Amirali-Bagheri/mac-dns-changer/main/dns.sh`: Downloads the `dns.sh` script from the specified URL.
- `chmod +x dns.sh`: Changes the permissions of the downloaded script to make it executable.
- `./dns.sh`: Executes the downloaded script.

**Note:** Make sure to review the script content and its purpose before executing it on your system.


> Tested on Mac OS 13+ running on Macbook Pro and iMac.

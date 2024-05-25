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
8. [Host Iran](https://hostiran.net/landing/proxy)
9. [Shatel](https://www.shatel.ir)
10. [Asia Tech](https://asiatech.ir)
11. [Pars Online](https://www.parsonline.com)
12. [Pishgaman](https://pishgaman.net)
13. [Resaneh Pardaz](https://www.resanehpardaz.ir)

## Global DNS Servers:
1. [Cloudflare](https://www.cloudflare.com/)
2. [Open DNS](https://www.opendns.com/)
3. [Google](https://google.com)
4. [Pihole](https://pi-hole.net)
5. [UncensoredDNS](https://blog.uncensoreddns.org)
6. CZ_NIC
7. [Level 3](http://www.level3.com/en)
8. [Comodo Secure](https://www.comodo.com/)
9. [Control D](https://controld.com/free-dns)
10. [Alternate](https://alternate-dns.com)
11. [Verisign](https://www.verisign.com)
12. [Open Nic](https://www.opennic.org)
13. [Yandex](https://dns.yandex.com)
14. [DNS Watch](https://dns.watch)
15. [Oracle Dyn](https://dyn.com)
16. [Freenom World](http://www.freenom.world)
17. [Flash Start](https://flashstart.com)
18. [Quad9](https://www.quad9.net)
19. Some DNS
20. [Neustar DNS](https://www.security.neustar/dns-services/free-recursive-dns-service)
22. Sprintlink
23. NTT
24. [CleanBrowsing](https://cleanbrowsing.org/filters)
25. [AdGuard](https://adguard-dns.io/en/public-dns.html)
26. [Norton ConnectSafe](https://dns.norton.com)
27. [SafeDNS](https://www.safedns.com)
28. [SmartViper](https://www.markosweb.com/free-dns)
29. [UncensoredDNS](https://blog.uncensoreddns.org)
30. [puntCAT](http://www.servidordenoms.cat)
31. [CNNIC SDNS](http://public.sdns.cn)
32. [AliDNS](http://www.alidns.com)
33. [DNSPod](https://www.dnspod.cn/products/public.dns)
34. [OneDNS](https://www.onedns.net)
35. [GreenTeamDNS](http://www.greentm.co.uk)
36. [OpenNIC](https://www.opennic.org)
37. [FreeDNS](https://freedns.zone)
38. [Hurricane Electric](https://dns.he.net)
39. [Baidu](https://dudns.baidu.com/intro/publicdns)
40. [114DNS](https://www.114dns.com)

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

### Running the Script with Options

You can directly run the script with an option. For example, to automatically find the best DNS server for 403 Unlock, use:

```bash
sh ./dns.sh 1
```

### Automate DNS Changes with Cron

To automate the DNS changes and find the best server every hour, you can set up a cron job. Here's how you can do it:

1. Open your crontab file for editing:

```bash
crontab -e
```

2. Add the following line to schedule the dns.sh script to run every hour:

```bash
0 * * * * /path/to/dns.sh 1
```

> Replace /path/to/dns.sh with the actual path to your dns.sh script.

This cron job will run the script at the beginning of every hour, automatically finding and setting the best DNS server.


> Tested on Mac OS 13+ running on Macbook Pro and iMac.

# MacOS DNS-changer

This is a shell script which is capable of setting DNS servers for WiFi (WLAN interface) on devices running MacOS.

### Caveats

> 1. Frequently uses colored text output. Might not be everyone's cup of tea :)
> 2. Some options require sudo  e.g. running nextdns, adguardHome
>    + Running a command with`sudo`is followed by `sudo -k` to revoke root access (i.e. using `sudo` again requires password).

The script can set DNS servers to:
1. A [Pihole](https://pi-hole.net) instance [*a local or a remote server*]
2. Run a local instance of [Adguard Home](https://github.com/AdguardTeam/AdGuardHome) and set it as a DNS server
3. Run a custom config of [NextDNS](https://nextdns.io) and set it as DNS server. Uses [NextDNS CLI client](https://github.com/nextdns/nextdns).
4. [UncensoredDNS](https://blog.uncensoreddns.org)
5. Set a custom DNS server (*based on user's input*)
6. Reset DNS server (*resets to the one broadcasted by your DHCP*)
7. Display current DNS server(s)
8. Short test of your DNS resolution. (*For a more thorough speed comparison you can use [R script|(https://github.com/dchakro/DNSSpeedTester))*



**Note**: You can modify this script for setting DNS also: 

1. On your wired ethernet by using something like this:

    `networksetup -setdnsservers Ethernet 1.1.1.1 1.0.0.1`.

2. On your USB-Ethernet dongle by using something like this:

   ```networksetup -setdnsservers "USB 10/100/1000 LAN” 1.1.1.1 1.0.0.1```

**The shell script comes without any warranty or liability. Use it at your own discretion.**

> Tested on Mac OS Ventura running on Macbook Pro and iMac.

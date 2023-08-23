# wireguard-ps1
PowerShell Helper Script to generate Wireguard configuration files (Server + Client)

This is another smal PowerShell script to generate the client and server configuration parts to easyly add new Peers (Clients).

## Requirements:
- Installed Wireguard Application
- wg command in search path (set PATH)

## How it works:
* open the script and change the variables as needed
* right click the powershell Script and select "Run with PowerShell"
* put in a new client name and press enter
* add the xxx.serverconfig text add the end or your wireguard configuration file and restart the server
* copy the xxx.clientconfig text to a new wireguard client configuration

## Variables


```
$serverPubKey = "your wireguard servers public key"
$routeIPNet = "192.168.178.0/24" # only traffic for this ip net will use the vpn tunnel
$endpoint = "hostname.com:51900" # ip/hostname and port of your wireguard server
$clientTunnelIP = "172.16.0.x/32" # Tunnel Net, this network should not conflict with your internal network
```
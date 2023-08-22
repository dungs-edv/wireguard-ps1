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
$routeIPNet = "10.10.1.0/24" # route all traffic for this ip over vpn tunnel
$endpoint = "ip:51900" # ip or hostname of wireguard server
$clientTunnelIP = "172.16.0.x/32" # ip address for tunnel network
```
$serverPubKey = "xxxxxxxxxxxxxxxxxxxxxxxxxxxx"
$routeIPNet = "192.168.178.0/24"
$endpoint = "ip:51900"
$clientTunnelIP = "172.16.0.x/32"

$name= Read-Host -Prompt "Enter client name"

#Check if Folder exists
If(!(Test-Path -Path $name))
{
    #powershell create directory
    New-Item -ItemType Directory -Path $name
    Write-Host "New folder created successfully!" -f Green
}
Else
{
  Write-Host "Folder already exists!" -f Yellow
}
cd $name

$psk = wg genpsk | tee client-presharedkey 
$privKey = wg genkey | tee client-privatekey  
$pubKey = Get-Content client-privatekey | wg pubkey | tee client-publickey
 
"[Interface]
PrivateKey = $privKey
Address = $clientTunnelIP

[Peer]
PublicKey = $serverPubKey
PresharedKey = $psk
AllowedIPs = $routeIPNet
Endpoint = $endpoint" > "$name.clientconf"

"[Peer]
# $name
PublicKey = $pubKey
PresharedKey = $psk
AllowedIPs = $clientTunnelIP" > "$name.serverconf"

pause
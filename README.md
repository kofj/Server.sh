# Server Bash Scripts

### 1. security

``` bash
#Anti SYN DDoS
iptables -I INPUT -p tcp --syn -m limit --limit 1/s -j ACCEPT
iptables -I FORWARD -p tcp --syn -m limit --limit 1/s -j ACCEPT

#Anti Port scanning
iptables -A FORWARD -p tcp --tcp-flags SYN,ACK,FIN,RST RST -m limit --limit 1/s -j ACCEPT

#Anti Ping of Death
iptables -A FORWARD -p icmp --icmp-type echo-request -m limit --limit 1/s -j ACCEPT
```


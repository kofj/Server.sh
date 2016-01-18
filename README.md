# Server Bash Scripts

### 1. security

``` 
#Anti SYN DDOOS
iptables -I INPUT -p tcp --syn -m limit --limit 1/s -j ACCEPT
iptables -I FORWARD -p tcp --syn -m limit --limit 1/s -j ACCEPT
```


yum install nano -y
systemctl stop firewalld
systemctl disable firewalld
clear
read -p " NODE ID sock : " node_id1
  [ -z "${node_id1}" ] && node_id1=0
  


read -p " NODE ID Vmess : " node_id2
  [ -z "${node_id2}" ] && node_id2=0



sudo sysctl -w net.ipv6.conf.all.disable_ipv6=1
sudo sysctl -w net.ipv6.conf.default.disable_ipv6=1
sudo sysctl -w net.ipv6.conf.lo.disable_ipv6=1
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw allow 80
sudo ufw allow 443

wget -N https://raw.githubusercontent.com/XrayR-project/XrayR-release/master/install.sh && bash install.sh

cd /etc/XrayR
  cat >key.pem <<EOF
-----BEGIN CERTIFICATE-----
MIIEpDCCA4ygAwIBAgIUMKTIToZKlRFK7pq/ggslE8NIvSIwDQYJKoZIhvcNAQEL
BQAwgYsxCzAJBgNVBAYTAlVTMRkwFwYDVQQKExBDbG91ZEZsYXJlLCBJbmMuMTQw
MgYDVQQLEytDbG91ZEZsYXJlIE9yaWdpbiBTU0wgQ2VydGlmaWNhdGUgQXV0aG9y
aXR5MRYwFAYDVQQHEw1TYW4gRnJhbmNpc2NvMRMwEQYDVQQIEwpDYWxpZm9ybmlh
MB4XDTIzMTAxMjEyNTYwMFoXDTM4MTAwODEyNTYwMFowYjEZMBcGA1UEChMQQ2xv
dWRGbGFyZSwgSW5jLjEdMBsGA1UECxMUQ2xvdWRGbGFyZSBPcmlnaW4gQ0ExJjAk
BgNVBAMTHUNsb3VkRmxhcmUgT3JpZ2luIENlcnRpZmljYXRlMIIBIjANBgkqhkiG
9w0BAQEFAAOCAQ8AMIIBCgKCAQEAlnerYRyak9mn/03tCUxvoexNFKwAXJGyFF7F
AlZa6diFE6gVZlbmzhs/iUdKhcidBMOIPFqi8GGTTBh846Bv4qFcehhv3Ey0SuiC
qDTAI7GXAU5ZfkqHn0S3J3FAEuyskb1PjetIph4TUzNa8fmvc6T+PlYlW/wrnBzL
56Cii8pUStbWAW+vEHIvBj4u6rjz/TWu054Ess6q6ZVbrX/5gMALAy3xIAp87mh7
xodNNkFxrRdq+DGEB3R2WYJ4RdNRizB4NeWXGaGffk+NwMtcAhTlNAQiuU7Gsctw
ncjNPmXfO6J9LPZ1o6Te51okfUmyNeanIvCey7aR52KDjUhx8wIDAQABo4IBJjCC
ASIwDgYDVR0PAQH/BAQDAgWgMB0GA1UdJQQWMBQGCCsGAQUFBwMCBggrBgEFBQcD
ATAMBgNVHRMBAf8EAjAAMB0GA1UdDgQWBBTCAvWJACT3YGkyg4mLGzbcg/DUHTAf
BgNVHSMEGDAWgBQk6FNXXXw0QIep65TbuuEWePwppDBABggrBgEFBQcBAQQ0MDIw
MAYIKwYBBQUHMAGGJGh0dHA6Ly9vY3NwLmNsb3VkZmxhcmUuY29tL29yaWdpbl9j
YTAnBgNVHREEIDAegg4qLnhtdHVubmVsLmNvbYIMeG10dW5uZWwuY29tMDgGA1Ud
HwQxMC8wLaAroCmGJ2h0dHA6Ly9jcmwuY2xvdWRmbGFyZS5jb20vb3JpZ2luX2Nh
LmNybDANBgkqhkiG9w0BAQsFAAOCAQEAGAU+AYg2SOOoZ63wP7covEsQMTn78EFU
q1Mn7aeUG5lHLliQ36+1oiul05GHiuubbql9wTx7YsgElmyXoJHbgaGWFKt4DTsy
LPmedXhG5/6e5am9vzkeOiosyD9XovzPRhBfMsWl0TRyvQtsR9dYdX8N5lurHNRC
01VjLiIuOvON4CZW7AYizJDjb8ekavgEhtaNeQntT8e8T8gAeIpviZawce/TtePL
n43vi+pnl7KS6X/p75UE77ldp9WjABAXwwg3+J0llNXbfvk4WcU+l80xKLX0yOud
D0whSh8Zy+U7AQnebG5aZMt3k31MycP3T3pwwF4m+7zwulV/5QCchQ==
-----END CERTIFICATE-----


EOF
  cat >crt.pem <<EOF
-----BEGIN PRIVATE KEY-----
MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCWd6thHJqT2af/
Te0JTG+h7E0UrABckbIUXsUCVlrp2IUTqBVmVubOGz+JR0qFyJ0Ew4g8WqLwYZNM
GHzjoG/ioVx6GG/cTLRK6IKoNMAjsZcBTll+SoefRLcncUAS7KyRvU+N60imHhNT
M1rx+a9zpP4+ViVb/CucHMvnoKKLylRK1tYBb68Qci8GPi7quPP9Na7TngSyzqrp
lVutf/mAwAsDLfEgCnzuaHvGh002QXGtF2r4MYQHdHZZgnhF01GLMHg15ZcZoZ9+
T43Ay1wCFOU0BCK5Tsaxy3CdyM0+Zd87on0s9nWjpN7nWiR9SbI15qci8J7LtpHn
YoONSHHzAgMBAAECggEAAl6YaEJfjltGZSrM7tvxWIti0VzMRxqwfC1NqUQKGCRQ
XKAMuHHpyOc81fZR8g9Jpp3U/5CKDjuWsdixissEK5nfCFXboDcdrp3dExknV3M5
G9OoF7A2cVJA+wPAmw8+TnbLA4n2KqRrYkQ0DGI+tuqO2/jIGbhYZXda2SABhmd0
loTrqlt1eAuguCsTsw1w/+n8JoBrpCGKju3f1N5TwxRu4iIw7HtNWM7nQjT1+SLr
P6B6pL8dVAcW6qHPoq9XeCgy7IRedgGgtDeQWvik2ZFaG0weHw4ublBbO7148YrX
rBlXJYSYKPRDUbzq68zWEibUKqKE1w72Oc+pxAximQKBgQDP2YggeJ6fOS2RmNjz
mYMAxTgDA98AqsuoGcv+X7dBGljNVNwGwCgOpaS+4A8occeDnCwpV5nuq4MCiVY2
UY3lqnc7RvKbPW6I5DkJpMoSsOqdQXJEif0jgB36Lfp9TDMSrN/a090K98OplZIw
sU6dRqd6QBcDH9jcalxmRWonSwKBgQC5Uxk4/IcvvdxCMi0U3XmSXTAwLSV+SvCN
pMDIkOWggAqsPS1zsg58+XNzM9VoFq0R/oVL4Q/lY3JFuz0uvsRpXr7lP+7sjauP
aZxViVNkvij4UH8+O7ONGujtb1Bavw6ZgHBxDI7PT99ughsF4L1A0IqLZtW25WvP
yGAjDrJu+QKBgC1sCnWeJnwBUNYKow7JM3nNn6n5BJjuukboLE5QuIl/qnxk2RiY
kahxxoj4Chf6lXFLhdMbE8a2sJCzVqXUOMBB+oB3xrjqOeesiFJ1MrvW8c6f6MrV
pP5HF0X/GkibiGXCZcE6n4mwD5BV4XbGqLlyIVN0AhNquEei7sJi1Qn1AoGAccDb
E4qV5C0S3KL13v/O1pNSt8+OWwXev+Kn3rRp7mmJo41tr71UfUuUnNrtHBYHJ6tl
4FyGKFQxWTID7QR1hQP+ArOKkTKoYr/9kNdZE9ZRSZIHeIimvm8NGGiiFwF9EaWv
3wRJSGELkUZVFfeL0xPuZoC5n6kU0xZ4RCyKQ+kCgYEAtSOaFf5qyTAcIH/CrL0i
2gy1Agmlkaty/1+DHMoQ735H+nQQ+CC2QsfanzB4LXBkS2MwhQ6bz025q98kJ8iT
6cg4YbmultSHhkfSYsdfDWzXgXDpVGNhZ9jfv0lrLuarbB7hzfK9AkZ2i6BtkaXW
rfGZSSc2Ap5GsZDuzmRmg08=
-----END PRIVATE KEY-----

EOF

cat >config.yml <<EOF
Log:
  Level: none # Log level: none, error, warning, info, debug 
  AccessPath: # /etc/XrayR/access.Log
  ErrorPath: # /etc/XrayR/error.log
DnsConfigPath: # /etc/XrayR/dns.json # Path to dns config, check https://xtls.github.io/config/dns.html for help
RouteConfigPath: # /etc/XrayR/route.json # Path to route config, check https://xtls.github.io/config/routing.html for help
InboundConfigPath: # /etc/XrayR/custom_inbound.json # Path to custom inbound config, check https://xtls.github.io/config/inbound.html for help
OutboundConfigPath: # /etc/XrayR/custom_outbound.json # Path to custom outbound config, check https://xtls.github.io/config/outbound.html for help
ConnectionConfig:
  Handshake: 4 # Handshake time limit, Second
  ConnIdle: 30 # Connection idle time limit, Second
  UplinkOnly: 2 # Time limit when the connection downstream is closed, Second
  DownlinkOnly: 4 # Time limit when the connection is closed after the uplink is closed, Second
  BufferSize: 64 # The internal cache size of each connection, kB
Nodes:
  -
    PanelType: "SSpanel" # Panel type: SSpanel, V2board, NewV2board, PMpanel, Proxypanel, V2RaySocks
    ApiConfig:
      ApiHost: "https://xmtunnel.com"
      ApiKey: "1122334455667788"
      NodeID: $node_id1
      NodeType: Shadowsocks # Node type: V2ray, Shadowsocks, Trojan, Shadowsocks-Plugin
      Timeout: 30 # Timeout for the api request
      EnableVless: false # Enable Vless for V2ray Type
      EnableXTLS: false # Enable XTLS for V2ray and Trojan
      SpeedLimit: 0 # Mbps, Local settings will replace remote settings, 0 means disable
      DeviceLimit: 0 # Local settings will replace remote settings, 0 means disable
      RuleListPath: # /etc/XrayR/rulelist Path to local rulelist file
    ControllerConfig:
      DisableSniffing: True
      ListenIP: 0.0.0.0 # IP address you want to listen
      SendIP: 0.0.0.0 # IP address you want to send pacakage
      UpdatePeriodic: 60 # Time to update the nodeinfo, how many sec.
      EnableDNS: false # Use custom DNS config, Please ensure that you set the dns.json well
      DNSType: AsIs # AsIs, UseIP, UseIPv4, UseIPv6, DNS strategy
      EnableProxyProtocol: false # Only works for WebSocket and TCP
      AutoSpeedLimitConfig:
        Limit: 0 # Warned speed. Set to 0 to disable AutoSpeedLimit (mbps)
        WarnTimes: 0 # After (WarnTimes) consecutive warnings, the user will be limited. Set to 0 to punish overspeed user immediately.
        LimitSpeed: 0 # The speedlimit of a limited user (unit: mbps)
        LimitDuration: 0 # How many minutes will the limiting last (unit: minute)
      GlobalDeviceLimitConfig:
        Enable: false # Enable the global device limit of a user
        RedisAddr: 127.0.0.1:6379 # The redis server address
        RedisPassword: YOUR PASSWORD # Redis password
        RedisDB: 0 # Redis DB
        Timeout: 5 # Timeout for redis request
        Expiry: 60 # Expiry time (second)
      EnableFallback: false # Only support for Trojan and Vless
      FallBackConfigs:  # Support multiple fallbacks
        -
          SNI: # TLS SNI(Server Name Indication), Empty for any
          Alpn: # Alpn, Empty for any
          Path: # HTTP PATH, Empty for any
          Dest: 80 # Required, Destination of fallback, check https://xtls.github.io/config/features/fallback.html for details.
          ProxyProtocolVer: 0 # Send PROXY protocol version, 0 for dsable
      CertConfig:
        CertMode: file # Option about how to get certificate: none, file, http, tls, dns. Choose "none" will forcedly disable the tls config.
        CertDomain: "vipppp.xmtunnel.com" # Domain to cert
        CertFile: /etc/XrayR/crt.pem
        KeyFile: /etc/XrayR/key.pem
        Provider: cloudflare # DNS cert provider, Get the full support list here: https://go-acme.github.io/lego/dns/
        Email: test@me.com
        DNSEnv: # DNS ENV option used by DNS provider
          CLOUDFLARE_EMAIL: 
          CLOUDFLARE_API_KEY: 
  -
    PanelType: "SSpanel" # Panel type: SSpanel, V2board, NewV2board, PMpanel, Proxypanel, V2RaySocks
    ApiConfig:
      ApiHost: "https://xmtunnel.com"
      ApiKey: "1122334455667788"
      NodeID: $node_id2
      NodeType: V2ray # Node type: V2ray, Shadowsocks, Trojan, Shadowsocks-Plugin
      Timeout: 30 # Timeout for the api request
      EnableVless: false # Enable Vless for V2ray Type
      EnableXTLS: false # Enable XTLS for V2ray and Trojan
      SpeedLimit: 0 # Mbps, Local settings will replace remote settings, 0 means disable
      DeviceLimit: 0 # Local settings will replace remote settings, 0 means disable
      RuleListPath: # /etc/XrayR/rulelist Path to local rulelist file
    ControllerConfig:
      DisableSniffing: True
      ListenIP: 0.0.0.0 # IP address you want to listen
      SendIP: 0.0.0.0 # IP address you want to send pacakage
      UpdatePeriodic: 60 # Time to update the nodeinfo, how many sec.
      EnableDNS: false # Use custom DNS config, Please ensure that you set the dns.json well
      DNSType: AsIs # AsIs, UseIP, UseIPv4, UseIPv6, DNS strategy
      EnableProxyProtocol: false # Only works for WebSocket and TCP
      AutoSpeedLimitConfig:
        Limit: 0 # Warned speed. Set to 0 to disable AutoSpeedLimit (mbps)
        WarnTimes: 0 # After (WarnTimes) consecutive warnings, the user will be limited. Set to 0 to punish overspeed user immediately.
        LimitSpeed: 0 # The speedlimit of a limited user (unit: mbps)
        LimitDuration: 0 # How many minutes will the limiting last (unit: minute)
      GlobalDeviceLimitConfig:
        Enable: false # Enable the global device limit of a user
        RedisAddr: 127.0.0.1:6379 # The redis server address
        RedisPassword: YOUR PASSWORD # Redis password
        RedisDB: 0 # Redis DB
        Timeout: 5 # Timeout for redis request
        Expiry: 60 # Expiry time (second)
      EnableFallback: false # Only support for Trojan and Vless
      FallBackConfigs:  # Support multiple fallbacks
        -
          SNI: # TLS SNI(Server Name Indication), Empty for any
          Alpn: # Alpn, Empty for any
          Path: # HTTP PATH, Empty for any
          Dest: 80 # Required, Destination of fallback, check https://xtls.github.io/config/features/fallback.html for details.
          ProxyProtocolVer: 0 # Send PROXY protocol version, 0 for dsable
      CertConfig:
        CertMode: file # Option about how to get certificate: none, file, http, tls, dns. Choose "none" will forcedly disable the tls config.
        CertDomain: "vipppp.xmtunnel.com" # Domain to cert
        CertFile: /etc/XrayR/crt.pem
        KeyFile: /etc/XrayR/key.pem
        Provider: cloudflare # DNS cert provider, Get the full support list here: https://go-acme.github.io/lego/dns/
        Email: test@me.com
        DNSEnv: # DNS ENV option used by DNS provider
          CLOUDFLARE_EMAIL: 
          CLOUDFLARE_API_KEY: 
EOF

xrayr restart

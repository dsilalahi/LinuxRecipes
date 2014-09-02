# disable firewall
sudo service iptables stop

# punch holes on port 80,443
iptables -A RH-Firewall-1-INPUT -m state --state NEW -p tcp --dport 80 -j ACCEPT
iptables -A RH-Firewall-1-INPUT -m state --state NEW -p tcp --dport 443 -j ACCEPT
#!/bin/bash
#
# Title         :iptables_allowall.sh
# Author        :Julio Sanz
# Website       :www.elarraydejota.com
# Email         :juliojosesb@gmail.com
# Description   :iptables rules to allow all IPv4/IPv6 communications in a machine (INPUT, OUTPUT, FORWARD) 
# Dependencies  :iptables-persistent
# Usage         :bash iptables_allowall.sh
# License       :GPLv3
#

# 
# MAIN
# 

# IPv4 default rules
echo "> Cleaning current rules for IPv4"
iptables -F
iptables -Z
iptables -X
echo "> Applying default policies (DROP) for IPv4"
iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT

# IPv6 default rules
echo "> Cleaning current rules for IPv6"
ip6tables -F
ip6tables -Z
ip6tables -X
echo "> Applying default policies (DROP) for IPv6"
ip6tables -P INPUT ACCEPT
ip6tables -P OUTPUT ACCEPT
ip6tables -P FORWARD ACCEPT

# Save iptables rules
iptables-save > /etc/iptables/rules.v4
ip6tables-save > /etc/iptables/rules.v6

# Show a summary of the rules applied
echo -e "_________________________________________________\n"
echo -e "------Current Iptables rules for IPv4"
echo -e "_________________________________________________\n"
iptables -nvL

echo -e "_________________________________________________\n"
echo -e "------Current Iptables rules for IPv6"
echo -e "_________________________________________________\n"
ip6tables -nvL
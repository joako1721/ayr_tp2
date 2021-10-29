#!/bin/bash
pacman -S wireguard-tools
echo "Ingrese la IPv4 publica del servidor (VM):"
read server_public_ip
echo "Ingrese la IP VPN (interfaz wg) del servidor (VM):"
read server_vpn_ip

server_pubkey="war9vIOlMRKqsHWM5Eal0V3O9kIq9i6Nu+KfFhHoLyo="
client_privkey="CBKSv3VjmP/trhkA6hRdWIXRtJqgB/y+gj94VN2EuVg="

echo $client_privkey > private

ip link add dev wg0 type wireguard
ip address add 10.0.0.1/24 dev wg0
wg set wg0 private-key ./private
ip link set up dev wg0

wg set wg0 peer $server_pubkey allowed-ips $server_vpn_ip endpoint "$server_public_ip:40000"

# Claves server (VM):
#
# public: war9vIOlMRKqsHWM5Eal0V3O9kIq9i6Nu+KfFhHoLyo=
# private: gNkSJpF+X+AtnvZS0zSeGC6QdOh+NWMxzqjm3CZL1HM=
#
# Claves cliente:
#
# public: lSF+OKvCmG7CiZWPTjaW47K28n9mjy08XYQe82gfcHE=
# private: CBKSv3VjmP/trhkA6hRdWIXRtJqgB/y+gj94VN2EuVg=

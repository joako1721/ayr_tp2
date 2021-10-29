#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
sudo wg-quick up wg0
sudo ufw allow from 10.0.0.253
sudo ufw allow 40000/udp
sudo ufw allow 8080/tcp
sudo ufw enable
clear
sleep 5
ip a | grep 192 | awk "{print \$2}" | xargs echo "Tu ip es: "
python -m http.server -b 10.0.0.253 8080

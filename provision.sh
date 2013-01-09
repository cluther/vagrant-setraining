#!/bin/sh

if [ ! -z "$1" ]; then
    hostname $1

    mkdir -p /root/.ssh
    chmod 0700 /root/.ssh
    echo "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAIEAzhTpLYtWMbmBiDkyr0MK8Hvo7SIZdogQCJrGLRYa0+F7L3ZXZFDeLVf2tsjSUU6YPkCbxjvU+lEsc7+V92tG/CbY4JT92NTIzYR0Zplh82+adMH/aI4dwiWtrM+NjzyQyWZAccLna4M5EOjJFu/s/QjEQIHo7WM8ztlraUiJJUE= Chet Luther" > /root/.ssh/authorized_keys
    chmod 0600 /root/.ssh/authorized_keys
fi

if [ "$1" == "core1" ]; then
    ip route add 10.77.1.0/24 via 10.255.0.3
    ip route add 10.77.2.0/24 via 10.255.0.11
    ip route add 10.77.3.0/24 via 10.255.0.19
    service iptables stop ; chkconfig iptables off
    echo 1 > /proc/sys/net/ipv4/ip_forward

    if ! grep -q "10.77.1.101" /etc/hosts
    then
        cat /vagrant/additional_hosts >> /etc/hosts
    fi

elif [ "$1" == "dist1" ]; then
    ip route add 10.77.2.0/24 via 10.255.0.2
    ip route add 10.77.3.0/24 via 10.255.0.2
    ip route add 10.255.0.8/29 via 10.255.0.2
    ip route add 10.255.0.16/29 via 10.255.0.2
    service iptables stop ; chkconfig iptables off
    echo 1 > /proc/sys/net/ipv4/ip_forward

elif [ "$1" == "dist2" ]; then
    ip route add 10.77.1.0/24 via 10.255.0.10
    ip route add 10.77.3.0/24 via 10.255.0.10
    ip route add 10.255.0.0/29 via 10.255.0.10
    ip route add 10.255.0.16/29 via 10.255.0.10
    service iptables stop ; chkconfig iptables off
    echo 1 > /proc/sys/net/ipv4/ip_forward

elif [ "$1" == "dist3" ]; then
    ip route add 10.77.1.0/24 via 10.255.0.18
    ip route add 10.77.2.0/24 via 10.255.0.18
    ip route add 10.255.0.0/29 via 10.255.0.18
    ip route add 10.255.0.8/29 via 10.255.0.18
    service iptables stop ; chkconfig iptables off
    echo 1 > /proc/sys/net/ipv4/ip_forward

elif [ "$1" == "zenoss" ]; then
    ip route add 10.255.0.0/16 via 10.77.1.2
    ip route add 10.77.2.0/24 via 10.77.1.2
    ip route add 10.77.3.0/24 via 10.77.1.2
    service iptables stop ; chkconfig iptables off

elif [ "$1" == "server2" ]; then
    ip route add 10.255.0.0/16 via 10.77.2.2
    ip route add 10.77.1.0/24 via 10.77.2.2
    ip route add 10.77.3.0/24 via 10.77.2.2
    service iptables stop ; chkconfig iptables off

elif [ "$1" == "server3" ]; then
    ip route add 10.255.0.0/16 via 10.77.3.2
    ip route add 10.77.1.0/24 via 10.77.3.2
    ip route add 10.77.2.0/24 via 10.77.3.2
    service iptables stop ; chkconfig iptables off
fi

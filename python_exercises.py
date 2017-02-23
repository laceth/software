#!/usr/bin/env python
from car import *
from electric_car import ElectricCar
import os
import socket
import argparse
import sys


def print_machine_info():
    host_name = socket.gethostname()
    ip_address = socket.gethostbyname(host_name)
    print ("Host name: %s" % host_name)
    print ("IP address: %s" % ip_address)
    
def get_remote_machine_info():
    remote_host = 'tarik'
    err_msg = ''
    try:
        print("IP address: %s" %socket.gethostbyname(remote_host))
    except Exception as err:
        print (" Bad Address %s: %s" %(remote_host,socket.error(err)))
     
def find_service_name():
    protocolname = 'tcp'
    for port in [80, 25]:
        print("Port: %s => service name: %s" %(port, socket.getservbyport(port, protocolname)))
    print("Port: %s => service name: %s" %(53,socket.getservbyport(53,'udp')))    
     
def test_socket_timeout():
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    print( "Default socket timeout: %s" %s.gettimeout())
    s.settimeout(50)
    print("Current socket timeout: %s" %s.gettimeout())    
 
 
        
def main():
    my_beetle = Car('volkswagen', 'beetle', 2016)
    print(my_beetle.get_descriptive_name())
    my_beetle.read_odometer()
    my_beetle.increment_odometer(120)
    my_beetle.read_odometer()
    my_beetle.get_charge()
    my_tesla = ElectricCar('tesla', 'roadster', 2016)
    print(my_tesla.get_descriptive_name())
    my_tesla.battery.describe_battery()
    print(os.getcwd())
    calcFilePath = 'C:\\Users\\lacethpc\\code'
    print(os.path.split(calcFilePath))
    pth='C:\\Users\\lacethpc\\code'
    print(os.listdir(pth))
    print(os.path.getsize(pth))
    
    totalsize = 0
    for f in os.listdir(pth):
        totalsize=totalsize + os.path.getsize(os.path.join(pth,f))
    print(totalsize)
    
    print_machine_info()
    find_service_name()
    test_socket_timeout()
    get_remote_machine_info()
    
if __name__=='__main__': main()
 
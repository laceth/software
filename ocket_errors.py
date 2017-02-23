#!/usr/bin/env python
import sys
import argparse
import socket

def host_search():
    parser = argparse.ArgumentParser(description='Socket Error Examples')
    parser.add_argument('--host', action="store", dest="host",required=False)
    parser.add_argument('--port', action="store", dest="port",type=int, required=False)
    parser.add_argument('--file', action="store", dest="file",required=False)    

    given_args = parser.parse_args()
    host = given_args.host
    port = given_args.port
    filename = given_args.file
    # First try-except block -- create socket

    try:
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    except Exception as err:
        print("Error creating socket: %s" %socket.error(err))
        sys.exit(1)

        # Second try-except block -- connect to given host/port
    try:
        s.connect((host, port))
    except Exception as err:
        print("Address-related error connecting to server: %s" %socket.gaierror(err))
        sys.exit(1)
    except Exception as err:
        print("Connection error: %s" %socket.error(err))
        sys.exit(1)
        
        # Third try-except block -- sending data
    try:
        s.sendall("GET %s HTTP/1.0\r\n\r\n" % filename)
    except Exception as err:
        print ("Error sending data: %s" %socket.error(err))
        sys.exit(1)
while 1:
        # Fourth tr-except block -- waiting to receive data from remote host
    try:
        buf = s.recv(2048)
    except Exception as err:
        print("Error receiving data: %s" %socket.error(err))
        sys.exit(1)
    if not len(buf):
        break
    # write the received data
    sys.stdout.write(buf)


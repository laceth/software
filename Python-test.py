#!/usr/bin/env python

def main():
    inp = input("Enter Fahrenheit Temperature:")
    try:
        fahr = float(inp)
        cel = (fahr - 32.0) * 5.0 / 9.0
        print("In Celsius it is: ", cel)
    except:
        print("Please enter a number")
        
        
        
if __name__=='__main__': main()

#!/usr/bin/python

from tkinter import *
from tkinter import ttk

class HelloApp:
    
    def __init__(self, master):
    
        self.label=ttk.Label(master, text='Hello tarik')
        self.label.grid(row=0,column=0,columnspan=2)
    
        ttk.Button(master, text ='Texas', command = self.texas_hello).grid(row=1,column=0)
        ttk.Button(master, text ='SanAntonio', command = self.sanantonio_hello).grid(row=1,column=1)
        ttk.Button(master, text = 'Click ME' , command = self.callback).grid(row=2,column=0)
    
    def texas_hello(self):
        self.label.config(text='Howdy partner')
        
    def sanantonio_hello(self):
        self.label.config(text='SanAntonio Hispanic')
        
    def callback(self):
        self.label.config(text='Thanks for Clicking Me')
        print('click')
        
def main():
        
    root = Tk()
    root.title('Intro windows GUI USING Tk')
    app = HelloApp(root)
      
                  
#====================
# Start GUI 
#======================
    root.mainloop()
if __name__=='__main__': main()

 

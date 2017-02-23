#!/usr/bin/python3


from tkinter import *
from tkinter import ttk
# instantiate contstructor 
root = Tk()
#Label(root, text="hello tarik riley").pack()

# create title entry
root.title("Intro")

# Disable resizing GUI window
#root.resizable(0,0)

#ttk.Label(root, text="A Label").grid(column=0, row=0) 


# Modify adding a Label
aLabel = ttk.Label(root, text="A Label")
aLabel.grid(column=0, row=0)

# Button Click Event Function
def clickMe():
    action.configure(text="** I have been Clicked! **")
    aLabel.configure(foreground='red')
    aLabel.configure(text='A Red Label')

# Adding a Button
action = ttk.Button(root, text="Click Me!", command=clickMe)   
action.grid(column=1, row=0)





#======================
# Start GUI
#======================
root.mainloop()




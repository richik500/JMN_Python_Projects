#Python version check
import sys #importing the system version
print(sys.version) #version control
#print(sys.winver) # This attribute is specific to Windows, hence causing an AttributeError in Colab's Linux environment.
print("Hello, World")
print(12)

print("Hello")      # Prints a string value
print(12)           # Prints an integer value
print(3.14)         # Prints a float (decimal) value
print(True)         # Prints Boolean value True
print(False)        # Prints Boolean value False
print(bool(1))      # Converts 1 into Boolean → True
print(bool(0))      # Converts 0 into Boolean → False
print(type(True))   # Displays the data type of True (bool)

#convert integer to number 6 to a string and float
number=6
print(str(number))
print(float(number))

#Convert the booleans to an integer, float, and string
bool_1 = True             # Store Boolean value True in variable bool_1
bool_2 = False            # Store Boolean value False in variable bool_2

print(int(bool_1))        # Convert True into integer → 1
print(int(bool_2))        # Convert False into integer → 0

print(float(bool_1))      # Convert True into float → 1.0
print(float(bool_2))      # Convert False into float → 0.0

print(str(bool_1))        # Convert True into string → "True"
print(str(bool_2))        # Convert False into string → "False"

print(bool(1))            # Convert 1 into Boolean → True
print(bool(0))            # Convert 0 into Boolean → False

#Addition

x=56+46+60+49+78.5+87.4

# How many minutes in 25.5 hours?
per_hour=60
hour=25.5
x=(hour*per_hour)
print(x)
print(type(x))

#how many hours in 3460 minutes?
min=3460
hour=3460/60
print(hour)
print(type(hour))

x=25
y=87
z=5*x-2*y
print(z)

t=z/7
print(t)

z=z/14
print(z)

x,y,z=400,100,25
print(x,y,z)
print(x)
print(y)
print(z)
print(x/y)
print(y/z)
print(z/x)
print(x+y+z)
print(x*y*z)
print(x-y-z)
print(x/y/z)
print(x//y//z)
print(x%y%z)

message="Hello World"
print(message[8])

len(   message     )

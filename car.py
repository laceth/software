"""A class that can be used to represent a car."""
class Car():
        
        """A simple attempt to represent a car."""
        def __init__(self, make, model, year, battery_size=120):
                """Initialize attributes to describe a car."""
                self.make = make
                self.model = model
                self.year = year
                self.odometer_reading = 0
                self.battery_size = battery_size
                
        def get_descriptive_name(self):
                """Return a neatly formatted descriptive name."""
                long_name = str(self.year) + ' ' + self.make + ' ' + self.model
                return long_name.title()
        
        def read_odometer(self):
                "Print a statement showing the car's mileage."
                print("This car has " + str(self.odometer_reading) + " miles on it.")
                
        def update_odometer(self, mileage):
                """
                Set the odometer reading to the given value.
                Reject the change if it attempts to roll the odometer back.
                """
                if mileage >= self.odometer_reading:
                        self.odometer_reading = mileage
                else:
                        print("You can't roll back an odometer!")
                        
        def increment_odometer(self, miles):
                """Add the given amount to the odometer reading."""
                self.odometer_reading += miles
                

# class Battery():
#         """A simple attempt to model a battery for an electric car."""
#         def __init__(self, battery_size=120):
#                 """Initialize the battery's attributes."""
#                 self.battery_size = battery_size

        def describe_battery(self):
                
                """Print a statement describing the battery size."""
                print("This car has a " + str(self.battery_size) + "-kWh battery.")
                
        def get_charge(self):
                """Print a statement about the range this battery provides."""
                if self.battery_size == 120:
                        charge = 2400
                elif self.battery_size == 1200:
                        charge = 2500
                message = "This car has a " + str(charge)
                message += " voltage charge rating."
                print(message)
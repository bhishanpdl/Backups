class Celsius(object):
    """ ."""
    
    def __init__ (self, temp=0):
        self.temp=temp
        
    def to_fahrenheit(self):
        """ ."""
        
        return self*1.8 + 32
        
    @property
    def temp(self):
        return self._temp
    
    @temp.setter
    def temp(self, value):
        if value < -273:
            raise ValueError("temp below -273 is not possible")
        print("Setting value")
        self._temp = value
    
    
        

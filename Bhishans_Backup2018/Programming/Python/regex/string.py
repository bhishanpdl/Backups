#splitting words in a string

import re
DATA = "Hey, you - what are you doing here!?"
print(re.findall(r"[\w']+", DATA))
# Prints ['Hey', 'you', 'what', 'are', 'you', 'doing', 'here']



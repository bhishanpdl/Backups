import re

line = "hw1 1\n"
regex = r'(.*?)(\d+)$'
a = re.match(regex, line).group(1)
print(a)


regex = r'(\d+)$'
a = re.compile(regex).search(line).group(1)
print(a)

#!/usr/bin/env python
#
# Regular Expression examples
# metacharacters: . ^ $ * + ? { } [ ] \ | ( )
# if we get <_sre.SRE_Match object at 0x10fa35850> like this just add .group(0) at the end of result

import re

print
str    = "Hello World I am learning Python"
pattern = re.compile("Python")     # ['Python']
match   = pattern.findall(str)     # match is matchObj or match_object
print match

print
str    = "Python,python,python"
pattern = re.compile("[Pp]ython")  # ['Python', 'python', 'python']
match   = pattern.findall(str)
print match

print
str    = "Python,python,python ruby rube"
pattern = re.compile("rub[ye]")  # ['ruby', 'rube']
match3   = pattern.findall(str)
print match


print
str    = "Python,python,python ruby rube A "
pattern = re.compile("[A-Z]")  # ['P', 'A']
match   = pattern.findall(str)
print match

print
str    = "Python,python,python ruby rube"
pattern = re.compile("^Python")  # ['Python']   # outside [] ^ is beginning
match   = pattern.findall(str)
print match


print
str    = "Python,python,python ruby rube"
pattern = re.compile("[^Python]")  # every letters except P y t h o n  inside [^] ^ is except
match   = pattern.findall(str)
print match

print
str    = "Python, python, python, ruby rube"
pattern = re.compile(",(.*?),")  #  ['python']
match   = pattern.findall(str)   # greedy .* output is : [' python, python']
print match

print
str    = "Python,python,python ruby rube rubyy grubyys"
pattern = re.compile("ruby?")   # ['ruby', 'rub', 'ruby', 'ruby']     ruby?  rub or ruby
#pattern = re.compile("ruby*")  # ['ruby', 'rub', 'rubyy', 'rubyy']   ruby*  0 or more ys
#pattern = re.compile("ruby+")  # ['ruby', 'rubyy', 'rubyy']          ruby+  1 or more ys
match   = pattern.findall(str)
print match



print
str    = "Python&Pail,python&pail,python"
pattern = re.compile("[Pp]ython&[Pp]ail")  # ['Python&Pail', 'python&pail']
match   = pattern.findall(str)
print match

print
str     = "Python,python,python ruby rube ruble"
pattern = re.compile("python|perl")  # ['python', 'python']
match   = pattern.findall(str)       # python or perl
print     match

print
str     = "Python!!!,Python?,python ruby rube ruble perl"
pattern = re.compile("Python!|Python\?")  # ['Python!', 'Python?']  if there is space betwn ! and | ans is Python?
match   = pattern.findall(str)
print     match

print
str     = "Python,aPython,aPython"
pattern = re.compile("^Python")  # start of string or line
match   = pattern.findall(str)   # |APython is start of string
print     match

print
str     = "aPython,aPython,Python"
pattern = re.compile("Python$")  # end of string or line
match   = pattern.findall(str)   # Python\Z is end of string
print     match


print
str     = 'one two three'              # twos = None, two = two, two two = two, two1 = None ( two for \b..\B)
match   = re.search(r"\btwo\b", str)    # re.search = two, re.findall = ['two']
print     match                         # <_sre.SRE_Match object at 0x106d60850>
print match.group(0)                    # two



print
str     = "Python!, Python,python ruby rube"
pattern = re.compile("P?ython")  # ['Python', 'Python', 'ython']
match   = pattern.findall(str)
print     match




# clear; python overflow1.py ; rm *~

from multiprocessing import Pool

def run_process(args):
    name = args[0]
    arguments = args[1]

commands = []
for x in range(20):
    commands.extend(("prog1.c",['./prog1']))
    commands.extend(("prog2.c",['./prog2']))
    commands.extend(("prog3.c",['./prog3', 'first argument']))

p = Pool()
p.map(run_process,commands)

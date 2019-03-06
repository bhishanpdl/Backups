from multiprocessing import Pool

def run_process(args):
    name = args[0]
    arguments = args[1]

commands = []
for x in range(20):
    commands.extend(("colour.c",['./cl',"color.txt",str(x) ]),
                    ("jeditransform", ['./jedi_imadjust',...),
                    ...)

p = Pool()
p.map(run_process, commands)

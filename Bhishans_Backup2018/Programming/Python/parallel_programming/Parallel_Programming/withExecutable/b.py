# clear; python b.py; rm *~

from multiprocessing import Pool

#function to run a program and write output to the shell
################################################################################
def run_process(name, args,):
    print("--------------------------------------------------------------------")
    print("Running: %s"%name)
    print("Command:")
    for arg in args:
        print(arg, end=' ')
    print("")
    print("--------------------------------------------------------------------")
    process = subprocess.Popen(args)

    process.communicate()
    if process.returncode != 0:
        print("Error: %s did not terminate correctly. Return code: %i."%(name, process.returncode))
        sys.exit(1)
################################################################################     


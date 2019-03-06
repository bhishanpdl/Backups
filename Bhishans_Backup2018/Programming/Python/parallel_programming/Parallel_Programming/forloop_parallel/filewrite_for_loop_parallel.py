# Author    : Bhishan Poudel
# Date      : Mar 14, 2016
# To delete : rm {0..4}.txt

# To check : python filewrite_for_loop.py && open 3.txt
for x in xrange(0,5):
    filename = str(x)+".txt"
    print(filename)
    myfile = open(filename,"w")
    string = "This is file "+str(x)+".txt"
    myfile.write(string)
    myfile.close()

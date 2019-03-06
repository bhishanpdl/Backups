with open('color.txt') as f:
    col0 = zip(*[line.split() for line in f])[0]
    col0 = zip(*[line.split() for line in f])[0]  # this fails
    print(col0[0])
    print(col0[100])

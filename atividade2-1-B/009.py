n = int(input())
while n != 0:
    size = int(input().split()[0])
    table = [[] for x in range(size)]
    keys = [int(x) for x in input().split()]
    for key in keys:
        table[key % size].append(key)

    for i in range(size):
        print('%d ->%s \\' % (i, (' %d ->' * len(table[i])) % tuple(table[i])))
    n -= 1
    if n != 0: print()

counter = 1
while True:
    N, Q = input().split()
    N = int(N)
    Q = int(Q)
    if Q == 0 and N == 0: break
    print("CASE# %d:" % counter)
    counter += 1
    numbers = []
    while N != 0:
        N -= 1
        numbers.append(int(input()))
    numbers.sort()
    while Q != 0:
        Q -= 1
        m = int(input())
        if m in numbers:
            print("%s found at %d" % (m, numbers.index(m) + 1))        
        else:
            print("%s not found" % m)
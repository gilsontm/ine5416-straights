while True:
    n = int(input())
    if n == 0: break
    while True:
        permutation = [int(x) for x in input().split()]
        if permutation[0] == 0: break
        entering = list((range(n, 0, -1)))
        station = []
        result = 'Yes'
        for e in permutation:
            if e in entering:
                while entering[-1] != e:
                    station.append(entering.pop())
                entering.pop()
            elif station[-1] == e: station.pop()
            else:
                result = 'No'
                break
        print(result)
    print()


            

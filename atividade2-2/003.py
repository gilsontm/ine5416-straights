while True:
    n = int(input())
    if n == 0: break
    entering = input().split()
    entering.reverse()
    permutation = input().split()
    station = []
    result = ''
    for e in permutation:
        if e in entering:
            while entering[-1] != e:
                station.append(entering.pop())
                result += 'I'
            entering.pop()
            result += 'IR'
        elif station[-1] == e:
            station.pop()
            result += 'R'
        else:
            result += ' Impossible'
            break
    print(result)
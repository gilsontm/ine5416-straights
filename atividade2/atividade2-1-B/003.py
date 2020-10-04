while True:
    n = int(input())
    if n == 0: break
    entering = input().split()
    permutation = input().split()
    station = []
    result = ''
    i = j = 0
    while True:
        if (len(station) != 0 and i < n and station[-1] == permutation[i]):
            station.pop()
            i += 1
            result += 'R'
        elif (j < n):
            station.append(entering[j])
            j += 1
            result += 'I'
        else: break
    if len(station) != 0:
        result += ' Impossible'
    print(result)
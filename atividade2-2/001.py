counter = 1
result = ''
while True:
    N, Q = input().split()
    N = int(N)
    Q = int(Q)
    if Q == 0 and N == 0: break
    result += 'CASE# %d:\n' % counter
    counter += 1
    numbers = []
    while N != 0:
        N -= 1
        numbers.append(int(input()))
    numbers.sort()
    while Q != 0:
        Q -= 1
        target = int(input())
        low = 0
        high = len(numbers)
        while low < high:
            middle = (low + high)//2
            if numbers[middle] < target: low = middle + 1
            else: high = middle
        if (low < len(numbers) and numbers[low] == target):
            result += '%s found at %d\n' % (target, low + 1)      
        else:
            result += '%s not found\n' % target
print(result[:-1])
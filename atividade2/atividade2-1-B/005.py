n = int(input())
while n != 0:
    n -= 1
    line = input()
    left = 0
    total = 0
    for c in line:
        if c == '<':
            left += 1
        elif c == '>' and left > 0:
            left -= 1
            total += 1
    print(total)
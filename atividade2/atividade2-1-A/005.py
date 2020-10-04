n = int(input())
while n != 0:
    n -= 1
    string = input()
    # primeira passada
    first = ""
    for c in string:
        first += chr(ord(c) + 3) if c.isalpha() else c
    # segunda passada
    second = first[::-1]
    third = second[:len(second) // 2]
    for c in second[len(second) // 2:]:
        third += chr(ord(c) - 1)
    print(third)
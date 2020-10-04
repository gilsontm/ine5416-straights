while True:
    k = int(input())
    if k == 0: break
    x1, y1 = map(float, input().split())
    while k != 0:
        k -= 1
        x2, y2 = map(float, input().split())
        if (x1 == x2 or y1 == y2):
            print('divisa')
        else:
            string = 'N' if y2 > y1 else 'S'
            string += 'E' if x2 > x1 else 'O'
            print(string)
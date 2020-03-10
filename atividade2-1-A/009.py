while True:
    n = int(input())
    if n == 0: break
    for _ in range(n):
        values = map(int, input().split())
        marked = list(map(lambda x: x <= 127, values))
        print(chr(65 + marked.index(True)) if sum(marked) == 1 else '*')
    
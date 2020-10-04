while True:
    h1, m1, h2, m2 = map(int, input().split())
    if h1 == 0 and m1 == 0 and h2 == 0 and m2 == 0: break

    minutes1 = h1 * 60 + m1
    minutes2 = h2 * 60 + m2

    print((minutes2 - minutes1) if minutes2 >= minutes1 else (24 * 60 - minutes1 + minutes2))
xor = lambda x, y: (x and not y) or (y and not x)
print(xor(bool(input()), bool(input())))
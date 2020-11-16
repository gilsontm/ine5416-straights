parity = lambda sequence: tuple(map(lambda x: 'Par' if int(x) % 2 == 0 else 'Impar', sequence))
print(parity(input().split()))
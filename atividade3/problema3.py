fibonacci = lambda n: 1 if n <= 2 else fibonacci(n - 1) + fibonacci(n - 2)
print(fibonacci(int(input())))
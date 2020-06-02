isApproved = lambda a, b, c: 'Aprovado' if (a + b + c) / 3 >= 6 else 'Reprovado'
print(isApproved(int(input()), int(input()), int(input())))
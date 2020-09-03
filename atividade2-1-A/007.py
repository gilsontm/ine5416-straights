n = int(input())
R = C = S = 0
while n != 0:
    n -= 1
    quantidade, tipo = input().split()
    if tipo == "R":
        R += int(quantidade)
    elif tipo == "C":
        C += int(quantidade)
    elif tipo == "S":
        S += int(quantidade)

print("Total: {} cobaias".format(R + C + S))
print("Total de coelhos: {}".format(C))
print("Total de ratos: {}".format(R))
print("Total de sapos: {}".format(S))
print("Percentual de coelhos: {:.2f} %".format(100 * C/(R + C + S)))
print("Percentual de ratos: {:.2f} %".format(100 * R/(R + C + S)))
print("Percentual de sapos: {:.2f} %".format(100 * S/(R + C + S)))

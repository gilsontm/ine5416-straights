N = int(input())
houses = []
i = 0
j = N - 1
while N != 0:
    N -= 1
    houses.append(int(input()))
K = int(input())
while houses[i] + houses[j] != K:
    if houses[i] + houses[j] < K: i += 1
    else: j -= 1
print('%d %d' % (houses[i], houses[j]))  

iteration = 1
while True:
    n = int(input())
    if n == 0: break
    I = n // 50
    n %= 50
    J = n // 10
    n %= 10
    K = n // 5
    L = n % 5
    print('Teste {}'.format(iteration))
    print('{} {} {} {}\n'.format(I, J, K, L))
    iteration += 1
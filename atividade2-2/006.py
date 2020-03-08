while True:
    n = int(input())
    if n == 0: break
    numbers = list(map(int, input().split()))
    numbers += numbers[0:2]
    peaks = 0
    for i in range(1, n + 1):
        if numbers[i] > numbers[i-1] and numbers[i] > numbers[i+1]: peaks += 1
        elif numbers[i] < numbers[i-1] and numbers[i] < numbers[i+1]: peaks += 1
    print(peaks)
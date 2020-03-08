from collections import deque
while True:
    n = int(input())
    if n == 0: break
    step = 1
    pile = deque(range(n, 0, -1))
    result = []
    while len(pile) > 1:
        result.append(pile.pop())
        pile.rotate(1)
    print('Discarded cards: %s' % str(result)[1:-1])
    print('Remaining card: %d' % pile[0])
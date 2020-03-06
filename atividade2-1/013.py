rocks, frogs = map(int, input().split())
river = [0 for i in range(rocks)]
def jumpAround(rock, jump):
    i = rock - 1
    while i >= 0:
        river[i] = 1
        i -= jump
    i = rock - 1 + jump
    while i < rocks:
        river[i] = 1
        i += jump
for _ in range(frogs):
    rock, jump = map(int, input().split())
    jumpAround(rock, jump)
for e in river:
    print(e)
while True:
    P, M, N = map(int, input().split())
    if P == 0 and M == 0 and N == 0: break
    pile = []
    while N != 0:
        N -= 1
        card = input().split()
        pile.append((int(card[0]), card[1]))
    pile.reverse()
    players = []
    while len(players) != P:
        players.append(pile[-M:])
        pile = pile[:-M]
    turn = 0
    step = 1
    last = pile.pop()
    new = True
    while True:
        if new and last[0] == 7:
            players[turn] += [pile.pop(), pile.pop()]
            new = False
        elif new and last[0] == 1:
            players[turn] += [pile.pop()]
            new = False
        elif new and last[0] == 11:
            new = False
        else:
            if new and last[0] == 12:
                step *= -1
            new = False
            cards = (c for c in players[turn] if c[0] == last[0] or c[1] == last[1])
            if len(cards) > 0:
                new = True 
                last = max(cards)
                players[turn].remove(last)
                if len(players[turn]) == 0:
                    print(turn + 1)
                    break
            else:
                card = pile.pop()
                if card[0] == last[0] or card[1] == last[1]:
                    new = True
                    last = card
                else:
                    players[turn].append(card)
        turn = (turn + step) % P
while True:
    try:
        expression = input()
        counter = 0
        for c in expression:
            if c == '(':
                counter += 1
            elif c == ')':
                counter -= 1
                if counter < 0: break
        print('correct' if counter == 0 else 'incorrect')
    except EOFError:
        break
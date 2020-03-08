n = int(input())
while n != 0:
    n -= 1
    string = input()
    stack = [None]
    result = True
    for c in string:
        if c in ('(', '[', '{'): stack.append(c)
        else:
            if (   (c == ')' and stack[-1] == '(')
                or (c == ']' and stack[-1] == '[')
                or (c == '}' and stack[-1] == '{')):
                stack.pop()
            else:
                result = False
                break
    print('S' if result and len(stack) == 1 else 'N')
n = int(input())
stack = [None] * n
top = 0
minimum = None
result = ''
while n != 0:
    n -= 1
    operation = input()
    if operation == 'MIN':
        result += 'EMPTY\n' if top == 0 else '%d\n' % minimum
    elif operation == 'POP':
        if top == 0:
            result += 'EMPTY\n'
        else:
            top -= 1
            value = stack[top]
            if value < minimum:
                minimum = 2 * minimum - value
    else:
        value = int(operation[5:])
        if top == 0:
            stack[top] = value
            minimum = value
        elif value < minimum:
            stack[top] = 2 * value - minimum
            minimum = value
        else:
            stack[top] = value
        top += 1
print(result[:-1])

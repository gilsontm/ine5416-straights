
class Node:
    def __init__(self, value, is_black=False):
        self.value = value
        self.is_black = is_black

    def __str__(self):
        return f"{self.value}{'B' if self.is_black else 'W'}"

def W(value=0):
    return Node(value)

def B(value=0):
    return Node(value, is_black=True)

board = [
    [B( ), W( ), W( ), B(1), B( ), B( )],
    [B( ), W( ), W( ), W( ), W(5), W( )],
    [B( ), W( ), W(1), W( ), W( ), W( )],
    [W(4), W( ), W( ), W( ), W( ), B( )],
    [W( ), W(6), W(5), W( ), W( ), B( )],
    [B( ), B( ), B( ), W( ), W(1), B(4)],
]

def print_board(board):
    for i in range(len(board)):
        print([str(x) for x in board[i]])

def possible(board, y, x, n):
    for i in range(6):
        if board[y][i].value == n:
            return False
    for i in range(6):
        if board[i][x].value == n:
            return False

    y0 = y1 = y
    while y0 > 0 and not board[y0-1][x].is_black: y0 -= 1
    while y1 < len(board) - 1 and not board[y1+1][x].is_black: y1 += 1

    space = y1 - y0 + 1
    for i in range(y0, y1+1):
        if board[i][x].value != 0:
            if abs(board[i][x].value - n) >= space:
                return False

    x0 = x1 = x
    while x0 > 0 and not board[y][x0-1].is_black: x0 -= 1
    while x1 < len(board) - 1 and not board[y][x1+1].is_black: x1 += 1

    space = x1 - x0 + 1
    for i in range(x0, x1+1):
        if board[y][i].value != 0:
            if abs(board[y][i].value - n) >= space:
                return False

    return True

def solve(board):
    for y in range(6):
        for x in range(6):
            if board[y][x].value == 0 and not board[y][x].is_black:
                for n in range(1, 7):
                    if possible(board, y, x, n):
                        board[y][x].value = n
                        solve(board)
                        board[y][x].value = 0
                return
    print_board(board)
    input()

solve(board)


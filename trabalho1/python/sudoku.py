
import numpy as np

board = np.array([
    [5,0,0,0,7,0,0,0,0,],
    [6,0,0,1,9,5,0,0,0,],
    [0,9,8,0,0,0,0,6,0,],
    [8,0,0,0,6,0,0,0,3,],
    [4,0,0,8,0,3,0,0,1,],
    [7,0,0,0,2,0,0,0,0,],
    [0,6,0,0,0,0,2,0,0,],
    [0,0,0,0,1,9,0,0,5,],
    [0,0,0,0,8,0,0,7,9,],
])

def possible(board, y, x, n):
    for i in range(0, 9):
        if board[y][i] == n:
            return False
    for i in range(0, 9):
        if board[i][x] == n:
            return False
    y0 = (y // 3) * 3
    x0 = (x // 3) * 3
    for i in range(3):
        for j in range(3):
            if board[y0+i][x0+j] == n:
                return False
    return True

def solve(board):
    for y in range(9):
        for x in range(9):
            if board[y][x] == 0:
                for n in range(1, 10):
                    if possible(board, y, x, n):
                        board[y][x] = n
                        solve(board)
                        board[y][x] = 0
                return
    print(board)
    input()

solve(board)
import ipdb; ipdb.set_trace()
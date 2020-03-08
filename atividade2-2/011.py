class BinaryTree:
    def __init__(self, value, left=None, right=None):
        self.value = value
        self.left = left
        self.right = right

    def insert(self, value):
        if value < self.value:
            if self.left: self.left.insert(value)
            else: self.left = BinaryTree(value)
        else:
            if self.right: self.right.insert(value)
            else: self.right = BinaryTree(value)

    def breadth(self):
        result = ""
        for level in range(self.height()):
            result += self.getLevel(level)
        return result
    
    def getLevel(self, level):
        if level == 0:
            return '%d ' % self.value
        else:
            result = ''
            if self.left: result += self.left.getLevel(level - 1)
            if self.right: result += self.right.getLevel(level - 1)
            return result

    def height(self):
        heightLeft = heightRight = 0
        if self.left: heightLeft = self.left.height()
        if self.right: heightRight = self.right.height()
        return max(heightLeft, heightRight) + 1

n = int(input())
counter = 1
while counter <= n:
    input()
    values = list(map(int, input().split()))
    tree = BinaryTree(values[0])
    for v in values[1:]:
        tree.insert(v)
    print("Case %d:" % counter)
    print(tree.breadth().strip())
    print()
    counter += 1
    
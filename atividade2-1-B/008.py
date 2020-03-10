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

    def prefix(self):
        if self.left and self.right:
            return '%d %s %s' % (self.value, self.left.prefix(), self.right.prefix())
        elif self.left:
            return '%d %s' % (self.value, self.left.prefix())
        elif self.right:
            return '%d %s' % (self.value, self.right.prefix())
        return str(self.value)
    
    def infix(self):
        if self.left and self.right:
            return '%s %d %s' % (self.left.infix(), self.value, self.right.infix())
        elif self.left:
            return '%s %d' % (self.left.infix(), self.value)
        elif self.right:
            return '%d %s' % (self.value, self.right.infix())
        return str(self.value)
    
    def postfix(self):
        if self.left and self.right:
            return '%s %s %d' % (self.left.postfix(), self.right.postfix(), self.value)
        elif self.left:
            return '%s %d' % (self.left.postfix(), self.value)
        elif self.right:
            return '%s %d' % (self.right.postfix(), self.value)
        return str(self.value)

n = int(input())
counter = 1
while counter <= n:
    input()
    values = list(map(int, input().split()))
    tree = BinaryTree(values[0])
    for v in values[1:]:
        tree.insert(v)
    print("Case %d:" % counter)
    print("Pre.: %s" % tree.prefix())
    print("In..: %s" % tree.infix())
    print("Post: %s" % tree.postfix())
    print()
    counter += 1



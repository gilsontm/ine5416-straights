x1, y1 = input().split(" ")
x2, y2 = input().split(" ")
d = ((float(x2) - float(x1))**2 + (float(y2) - float(y1))**2)**(0.5)
print("{:.4f}".format(d))
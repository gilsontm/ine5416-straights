distance = lambda p1, p2: ((p1[0] - p2[0])**2 + (p1[1] - p2[1])**2 + (p1[2] - p2[2])**2)**(1/2)
print(distance((float(input()), float(input()), float(input())),
               (float(input()), float(input()), float(input()))))
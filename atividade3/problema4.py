baskhara = lambda a, b, c: ((-b + (b**2 - 4 * a * c)**(1/2))/(2 * a), (-b - (b**2 - 4 * a * c)**(1/2))/(2 * a))
print(baskhara(float(input()), float(input()), float(input())))
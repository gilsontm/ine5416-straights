print((lambda a, b, c: a if a > b and a > c else (b if b > a and b > c else c))
      (float(input()), float(input()), float(input())))
n = int(input())
countries = []
while n != 0:
    n -= 1
    countries.append(tuple(input().split()))
countries.sort(key=lambda c: (-int(c[1]), -int(c[2]), -int(c[3]), c[0]))
for country in countries:
    print('%s %s %s %s' % country)
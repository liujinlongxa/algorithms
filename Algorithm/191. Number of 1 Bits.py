def hammingWeight(self, n):
    ret = 0
    while n > 0:
        if n % 2 == 1:
            ret += 1
        n = n >> 1
    return ret


# Another Solution

def hammingWeight2(self, n):
    ret = 0
    while n > 0:
        n = n & (n - 1)
        n = n >> 1
        ret += 1
    return ret

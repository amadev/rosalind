def mendel(k, m, n):
    s = k + m + n
    return k/s * (k - 1)/(s -1) + k/s * m/(s -1) + k/s * n/(s -1) + \
        m/s * k/(s - 1) + m/s * 0.75 * (m - 1)/(s - 1) + m/s * 0.5 * n/(s - 1) + \
        n/s * k/(s - 1) + n/s * 0.5 * m / (s - 1)

print(mendel(17, 17, 29))

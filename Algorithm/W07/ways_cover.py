def cover_board(k,n):
    DP = [0] * (n +1)
    DP[0] = 1

    for i in range(1,n+1):
        DP[i] += DP[i-1]
        if i>=k:
            DP[i] += DP[i-k]

    return DP[n]
k=4
n=3

print(cover_board(k,n))
# PRINT-LCS(c, X, Y, i, j)
#     if c[i, j] == 0
#         return
#     if X[i] == Y[j]
#         PRINT-LCS(c, X, Y, i - 1, j - 1)
#         print X[i]
#     else if c[i - 1, j] > c[i, j - 1]
#         PRINT-LCS(c, X, Y, i - 1, j)
#     else
#         PRINT-LCS(c, X, Y, i, j - 1)

def lcs_length_constant_space(A, B):
    m, n = len(A), len(B)
    if m < n:
        A, B, m, n = B, A, n, m
    
    dp = [0] * (n + 1)
    prev_value = 0
    for i in range(1, m + 1):
        for j in range(1, n + 1):
            temp = dp[j]
            if A[i - 1] == B[j - 1]:
                dp[j] = prev_value + 1
            else:
                dp[j] = max(dp[j], dp[j - 1])
            prev_value = temp  # 更新 prev_value 為下一次迭代做準備
        print(dp)
    return dp[n]
def MEMOIZED_LCS_LENGTH(i, j):
    if c[i][j] != -1:
        return c[i][j]
    if i == 0 or j == 0:
        c[i][j] = 0
        return c[i][j]
    elif X[i-1] == Y[j-1]:
        c[i][j] = MEMOIZED_LCS_LENGTH(i - 1, j - 1) + 1
        return c[i][j]
    else: 
        c[i][j] = max(MEMOIZED_LCS_LENGTH(i - 1, j), MEMOIZED_LCS_LENGTH(i, j - 1))
        return c[i][j]
    

def lcs_recursive(i, j):
    # 如果已經計算過，則直接返回
    if memo[i][j] != -1:
        return memo[i][j]
    # 基本情況
    if i == 0 or j == 0:
        memo[i][j] = 0
    elif A[i - 1] == B[j - 1]:
        memo[i][j] = lcs_recursive(i - 1, j - 1) + 1
    else:
        memo[i][j] = max(lcs_recursive(i - 1, j), lcs_recursive(i, j - 1))
    
    return memo[i][j]


# 示例
A = "dormitory"
B = "dirtyroom"
m, n = len(A), len(B)
# 建立一個 (m+1) x (n+1) 的備忘錄
memo = [[-1 for _ in range(n + 1)] for _ in range(m + 1)]
print(lcs_recursive(m, n))  # 輸出：4
X = "dormitory"
Y = "dirtyroom"
m =len(X)
n=len(Y)
c = [[-1]*(n+1)]*(m+1) # 不能這樣初始化, 這樣會在使用c[0][0] = 0時，所有 c[1][0],c[2][0]都會等於0
c= [[-1 for _ in range(n + 1)] for _ in range(m + 1)]
print(MEMOIZED_LCS_LENGTH(m,n)) # 輸出：3
# for row in memo:
#     print(row)
# for row in c:
#     print(row)
# for row in c:
#     print(row)
# print(lcs_length_constant_space("dormitory","dirtyroom"))

# def lcs_length(A, B):
#     m, n = len(A), len(B)
#     # 建立一個 (m+1) x (n+1) 的備忘錄
#     memo = [[-1 for _ in range(n + 1)] for _ in range(m + 1)]
    
#     def lcs_recursive(i, j):
#         # 如果已經計算過，則直接返回
#         if memo[i][j] != -1:
#             return memo[i][j]
        
#         # 基本情況
#         if i == 0 or j == 0:
#             memo[i][j] = 0
#         elif A[i - 1] == B[j - 1]:
#             memo[i][j] = lcs_recursive(i - 1, j - 1) + 1
#         else:
#             memo[i][j] = max(lcs_recursive(i - 1, j), lcs_recursive(i, j - 1))
        
#         return memo[i][j]
    
#     # 調用遞歸函數
#     return lcs_recursive(m, n)
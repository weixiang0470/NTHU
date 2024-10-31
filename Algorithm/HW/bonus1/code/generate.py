import random

filename = 'random_numbers.txt'

# 生成随机数并写入文件
with open(filename, 'w') as file:
    for _ in range(10000000):  # 生成 10000000 个随机数
        number = random.randint(1, 10000001)  # 生成 1 到 10000000 之间的随机整数
        file.write(f"{number} ")  # 将数字写入文件，每个数字占一行

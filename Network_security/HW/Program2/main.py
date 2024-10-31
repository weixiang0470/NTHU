Alphabet = [0] * 26

f = 'Manual for the Solution of Military Ciphers.txt'
try:
    with open(f,'r',encoding='utf-8') as file:
        content = file.read()
except FileNotFoundError:
    print("File not found, please check file's path")

for c in content:
    if(ord(c) >=97 and ord(c) <= 122):
        Alphabet[ord(c) - 97]+=1
    elif(ord(c) >= 65 and ord(c) <= 90):
        Alphabet[ord(c) - 65]+=1
#print(Alphabet)

total = 0
for num in Alphabet:
    total += num
#print(total)

for i in range(len(Alphabet)):
    print(f"{chr(i+97)}:{Alphabet[i]/total * 100:.2f}%")

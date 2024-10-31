import random
import time
import math

def Partition(A,p,r):
    pivot = A[r]
    i=p-1
    for j in range(p,r):
        if A[j] <= pivot:
            i=i+1
            A[i],A[j] = A[j],A[i]
    if i < r:
        A[i+1],A[r] = A[r],A[i+1]
    return i+1

def Randomized_partition(A,p,r):
    i = random.randint(p,r)
    A[r],A[i] = A[i],A[r]
    return Partition(A,p,r)

def Randomized_select(A,p,r,i):
    if p==r: 
        return A[p]
    q = Randomized_partition(A,p,r)
    k = q-p +1
    if i==k : 
        return A[q]
    elif i<k:
        return Randomized_select(A,p,q-1,i)
    else: 
        return Randomized_select(A,q+1,r,i-k)
    
def Partition_around(A,p,r,m):
    # Get index of m
    i = -1
    for j in range(p, r):
        if A[j] == m:
            i = j
            break
    # Swap m with last element in A
    A[i],A[r] = A[r],A[i]
    #Partition as usual
    return Partition(A,p,r)

def Select(A,p,r,i,G):
    #print(A)
    if p==r:
        return A[p]
    
    while (r-p+1)%G!=0:
        for j in range(p+1,r+1):
            if A[p] > A[j]:
                A[p],A[j] = A[j],A[p]
        if i==1:
            return A[p]
        p=p+1
        i=i-1
    g = math.ceil((r-p+1)//G)
    #sort
    for j in range(p,p+g):
        if G == 3:
            selected_indices = [j,j+g,j+2*g]
        elif G == 5:
            selected_indices = [j,j+g,j+2*g,j+3*g,j+4*g]
        elif G == 7:
            selected_indices = [j,j+g,j+2*g,j+3*g,j+4*g,j+5*g,j+6*g]
        elif G == 9:
            selected_indices = [j,j+g,j+2*g,j+3*g,j+4*g,j+5*g,j+6*g,j+7*g,j+8*g]
        selected_numbers = [A[x] for x in selected_indices if x <= r]
        selected_numbers.sort()
        for index, value in zip(selected_indices, selected_numbers):
            if index <= r:
                A[index] = value
    m = Select(A,p+2*g,((p+(3*g))-1),math.ceil(g/2),G)
    q = Partition_around(A,p,r,m)
    k = q-p+1
    if i==k:
        return A[q]
    elif i<k:
        return Select(A,p,q-1,i,G)
    else :
        return Select(A,q+1,r,i-k,G)

def Calculate_time(N,K,elements,cnt):
    start_time = time.time()
    Randomized_select(elements.copy(),0,N-1,K)
    end_time = time.time()
    random_time = end_time - start_time
    Random_time.append(random_time)

    start_time = time.time()
    Select(elements.copy(),0,N-1,K,3)
    end_time = time.time()
    execution_3_time = end_time - start_time
    Select_3_time.append(execution_3_time)

    start_time = time.time()
    Select(elements.copy(),0,N-1,K,5)
    end_time = time.time()
    execution_5_time = end_time - start_time
    Select_5_time.append(execution_5_time)

    start_time = time.time()
    Select(elements.copy(),0,N-1,K,7)
    end_time = time.time()
    execution_7_time = end_time - start_time
    Select_7_time.append(execution_7_time)

    start_time = time.time()
    Select(elements.copy(),0,N-1,K,9)
    end_time = time.time()
    execution_9_time = end_time - start_time
    Select_9_time.append(execution_9_time)

    print(f"Round{cnt}: Random:{random_time:.2f} , 3:{execution_3_time:.2f} , 5:{execution_5_time:.2f} , 7:{execution_7_time:.2f} , 9:{execution_9_time:.2f}")

if __name__ == "__main__" :
    # input
    N, K, G = map(int, input().split())
    elements = list(map(int, input().split()))
    print(Select(elements.copy(),0,N-1,K,G))
    # print(Randomized_select(elements.copy(),0,N-1,K,G))

    # Calculate time
    Random_time=[]
    Select_3_time=[]
    Select_5_time=[]
    Select_7_time=[]
    Select_9_time=[]
    # for i in range(50):
    #     N = 10000000
    #     K = random.randint(1,N+1)
    #     random_numbers = [random.randint(1, N+1) for _ in range(N)]
    #     Calculate_time(N,K,random_numbers,i+1)
    # All_time=[]
    # All_time.append(Random_time)
    # All_time.append(Select_3_time)
    # All_time.append(Select_5_time)
    # All_time.append(Select_7_time)
    # All_time.append(Select_9_time)

    # print(All_time)
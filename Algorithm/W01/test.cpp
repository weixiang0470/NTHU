//#include <bits/stdc++.h>
#include <iostream>
#include <vector>

using namespace std;
void printArray(vector<int>& arr) {
    for (int num : arr) {
        cout << num << " ";
    }
    cout << endl;
}
void Insertion_Sort(vector<int>& ArrA,int n){
    //int ArrayB[n-1];
    /*for(int i=0;i<n-1;i++){
        ArrayB[i] = ArrA[i];
    }*/
    if(n<=1)return;
    // cout<<"Insertion_Sort\n";
    Insertion_Sort(ArrA,n-1);

    int key = ArrA[n-1];
    int tmp = n-2;

    while(tmp >= 0 && ArrA[tmp]>key){
        ArrA[tmp+1] = ArrA[tmp];
        tmp--;
    }
    ArrA[tmp+1]=key;
}
int main(void){
    vector<int> Arr={5,2,7,3,9};
    int n=Arr.size();
    // for(int i=0;i<sizeof(Arr)/sizeof(Arr[0]);i++){
    //     cout<< Arr[i]<<" ";
    // }
    // cout<<"\n";
    printArray(Arr);
    Insertion_Sort(Arr,n);
    printArray(Arr);
    // for(int i=0;i<sizeof(Arr)/sizeof(Arr[0]);i++){
    //     cout<< Arr[i]<<" ";
    // }
    // cout<<"\n";
}


void Insert(vector<int>& ArrB,int An){
    int n2 = sizeof(ArrB)/sizeof(ArrB[0]);
    cout<<"Insert\n";
    ArrB[n2]=An;
    printArray(ArrB);
    for(int i=n2-1;i>0;i--){
        if(ArrB[i]<ArrB[i-1]){
            int tmp=ArrB[i-1];
            ArrB[i-1] = ArrB[i];
            ArrB[i]=tmp;
        }
        else break;
    }
    printArray(ArrB);
    /*for(int i=0;i<n2+1;i++){
        Arr[i] = Arrtmp[i];
    }*/
}
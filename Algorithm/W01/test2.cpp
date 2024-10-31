#include <iostream>
#include <vector>

using namespace std;

int RecursiveBinarySearch(vector<int>& arr,int x,int Min,int Max){
    int Mid = (Min+Max)/2;
    if(Min>Max)return -1;
    if(arr[Mid]==x)return 1;
    else if(arr[Mid]>x)return RecursiveBinarySearch(arr,x,Min,Mid-1);
    else return RecursiveBinarySearch(arr,x,Mid+1,Max);
    //return false; 
    return -1;
}

int main() {
    vector<int> arr = {2, 3, 3, 5, 6,8,10,13,16,18,70};
    int n = arr.size();
    int x;
    cin>>x;
    //cout<<n<<"\n";
    //int get=RecursiveBinarySearch(arr,x,0,n-1);

    cout<<RecursiveBinarySearch(arr,x,0,n-1)<<endl;
        
    return 0;
}

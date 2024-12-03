#include <bits/stdc++.h>
using namespace std;

typedef long long int ll;
ll n,x;
pair<ll,int> arr[5036];

template <class Ty, class FuncTy>
pair<Ty,Ty> BS(Ty L,Ty R,FuncTy check){
	if(check(R))return {R,R+1};
    if(!check(L))return {L-1,L};
    while(L+1<R){
    	Ty Mid = L + (R-L)/2;
        if (check(Mid))L=Mid;
        else R=Mid;
    }
    return {L,R};
}

int main(void){
	cin >> n >> x;
    for(int i=0;i<n;++i){
    	cin >> arr[i].first;
        arr[i].second = i+1;
    }
    arr[n].first = x;
    sort(arr,arr+n);
    for(int i=0;i<n;i++){
    	for(int j=i+1;j<n;j++){
        	ll target = x - arr[i].first - arr[j].first;
            auto check = [&](ll t){
            		return arr[t].first < target;
                    };
            //auto gap = (BS(1ll+j,n,check));
            auto [L,R] = BS(1LL+j,n,check);
            //cout<<L<<":"<<R<<","<<gap.first<<":"<<gap.second<<endl;
            if(arr[R].first == target){
            	cout<<arr[i].second<<" "<<arr[j].second<<" "<<arr[R].second;
                return 0;
            }
        }
    }
    cout<<"IMPOSSIBLE";
}
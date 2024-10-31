#include <bits/stdc++.h>

using namespace std;
typedef long long int ll;
int main(void){
	int n,d;
  	cin >> n;
  	ll tasks_duration[n];
  	ll sum=0;
  	for(int i=0;i<n;++i){
    	cin >> tasks_duration[i] >> d;
      	sum+=d;
    }
  	sort(tasks_duration,tasks_duration+n);
  	for(int i=0;i<n;++i){
    	sum -= tasks_duration[i]*(n-i);
    }
  	cout<<sum;
}
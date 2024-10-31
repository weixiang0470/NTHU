#include <bits/stdc++.h>

using namespace std;
int n;
long long int a[20];
long long min_diff = 999999999999;

void dfs(int num, long long int left,long long int right){
	if(num == n){
    	min_diff = min(min_diff, abs(left - right));
      return;
    }
  dfs(num+1,left + a[num],right);
  dfs(num+1,left, right + a[num]);
  
}

int main(void){
	cin >> n;
  for(int i=0;i<n;i++){cin >> a[i];}
  dfs(0,0,0);
  cout<<min_diff;
}
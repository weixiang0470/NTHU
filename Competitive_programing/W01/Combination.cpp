#include <bits/stdc++.h>

using namespace std;
int n,m,tmp=0;
int a[100];
int ans[100];
bool vst[100];

void print(){
	for(int i=0;i<m;++i){
    	cout<<ans[i]<<" \n"[i==m-1];
    }
}

void dfs(int num,int start){
	if(num == m){
    	print();
      return;
    }
  	for(int prev=-1,j=start;j<n;++j){
    	if(vst[j] || prev == a[j])continue;
      ans[tmp++] = a[j];
      vst[j]=true;
      dfs(num+1,j+1);
      vst[j]=false;
      --tmp;
    }
}

int main(void){
	cin >> n >> m;
  for(int i=0;i<n;++i){cin >> a[i];}
  sort(a,a+n);
  dfs(0,0);
}
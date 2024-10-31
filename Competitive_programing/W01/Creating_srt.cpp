#include <bits/stdc++.h>
using namespace std;
int cnt=0,n;
vector<string> ans;
char tmp_ans[8];
string input;
bool vst[8];
int m=0;

void add_ans(){
	ans.push_back(tmp_ans);
}

void dfs(int i){
	if(i==n){
      ++cnt;
      add_ans();
      return;
    }
  	for(int prev=-1,j=0;j<n;++j){
      if(vst[j] || prev==input[j])continue;
      vst[j]=true;
      tmp_ans[m++]=input[j];
      dfs(i+1);
      vst[j]=false;
      --m;
      prev=input[j];
    }

}


void print(){
	for(int i=0;i<ans.size();++i){
    	cout<<ans[i]<<"\n";
    }
}
int main(void){
  
  cin >> input;
  n = input.size();
  sort(input.begin(),input.end());
  dfs(0);
  cout<<cnt<<"\n";
  print();
  
}
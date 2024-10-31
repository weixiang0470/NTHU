#include <bits/stdc++.h>

using namespace std;
int t,n;
set<string> ans;
int num[12];
int selected[12];

void get_ans(int selected_num){
  string s;
  for(int i=0;i<selected_num;++i){//將所有選擇的數字走一遍
  	if(i) s+="+"; //如果不是第一個就加上+的符號
    s += to_string(selected[i]);  // s 加上被選的數字
  }
  ans.emplace(s);
}

void dfs(int depth,int sum, int selected_num){
  if(sum<0)return;
  if(depth == n){
  	if(sum) return; //sum is not 0,not getting answer
    get_ans(selected_num);
    return;
  }
	dfs(depth+1,sum,selected_num); // 不選這個數字
	selected[selected_num] = num[depth]; //選擇這個數字
  	dfs(depth+1,sum - selected[selected_num], selected_num +1);//選了，然後繼續遞回下一個數字
}

int main(void){
	while(cin>>t>>n&&n){ //輸入t，輸入n、n不為0
    	ans.clear(); //一開始清空答案陣列
      	for(int i=0;i<n;++i){
        	cin>>num[i];
        }
      	cout << "Sums of "<<t<<":\n";
      	dfs(0,t,0);//dfs get ans;
      if(ans.empty())cout<<"NONE\n";
      else{
      	for(auto p=ans.rbegin();p!=ans.rend();++p){ //print ans from last to first
        	cout<< *p <<endl;
        }
      }
      
      
    }
}
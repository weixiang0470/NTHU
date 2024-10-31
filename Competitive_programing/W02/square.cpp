#include <bits/stdc++.h>

using namespace std;

int M,mask,target;
int sticks[20];

int lowbit(int x){
	return x & -x;
}

bool dfs(int used,int length, int last){
	if(used == mask)return true; 	//If all sticks are used
  	if(last == M)return false;		//If all sticks checked, but not used
  	int available_sticks = mask - (1<<last) +1; //available stick = last to M-1 sticks
  	int unuse_sticks = available_sticks & ~used; //unuse stick = available stick and not used sticks
  	for(int num=0;unuse_sticks ; unuse_sticks ^= num){//when unuse sticks not yet used keep looping, and each time unuse sticks do XOR with num to turn used stick into 0
    	num=lowbit(unuse_sticks);
      int idx = __lg(num);
      int nl = sticks[idx] + length;
      if(nl > target)continue;
      if(nl==target&&dfs(used|num,0,0))return true;
      if(dfs(used|num,nl,idx+1))return true;
    }
  return false;

}

int main(void){
	int N;
  	cin>>N;
  	while(N--){
      cin>>M;
      int sum=0;
        for(int i=0;i<M;++i){
          cin >> sticks[i];
          sum+=sticks[i];
       }
      target = sum/4;
      mask = (1 << M)-1;
      
      if(M<4 || sum%4 || !dfs(0,0,0)){cout<<"no\n";}
      else{
        //dfs get ans
        cout<<"yes\n";
        //for(int i=0;i<M;++i)cout << sticks[i]<<" \n"[i==M-1];
      }
      
    }
}

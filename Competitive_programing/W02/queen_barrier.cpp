#include <bits/stdc++.h>

using namespace std;

int MASK,n,ans;
int barrier[8];
int lowbit(int x){return x & -x;}

void dfs2(int M, int L, int R,int depth){
	if(M==MASK){
    	++ans;
      return;
    }
  int Legal = MASK & ~(M | L | R | barrier[depth]);
  for (int num=0;Legal;Legal ^= num){
  	num = lowbit(Legal);
    dfs2(M | num, (L|num)<<1, (R|num)>>1 , depth +1);
  }
	
}


void print(){
	for(int i=0;i<8;++i){
    	cout<< barrier[i];
    }
  cout<<endl;
}

void input(){
	string buffer;
  	for(int i=0;i<8;++i){
   		cin >> buffer;
      	for(int j=0;j<8;++j){
        	if(buffer[j]=='*'){
              //print();
            	barrier[i] |= (1<<j);
              //print();
            }
        }
    }

}

int main(void){
  input();
	//print();
  ans=0,n=8;
  MASK = (1<<n)-1;
  dfs2(0,0,0,0);
  cout<<ans<<endl;
  //cin >> n;

}

/*
const int MAXN = 8;
bool column_has_queen[MAXN];
bool LD_RU_Diagonal[MAXN * 2 -1];
bool LU_RD_Diagonal[MAXN * 2 -1];
int n;

//auto LD_RU_Diagonal = [&](int y, int x)
	//{return (y+x);};
//auto LU_RD_Diagonal = [&](int y, int x)
	//{return n-1 + (y-x);};
void update(int y, int x, bool val){
	column_has_queen[x]=val;
  LD_RU_Diagonal[y+x]=val;
  LU_RD_Diagonal[n-1+(y-x)]=val;
}

bool isValidQueenPosition(int y, int x){
	if(column_has_queen[x])return false;
  	if(LD_RU_Diagonal[y+x])return false;
  	if(LU_RD_Diagonal[n-1+(y-x)])return false;
  return true;
}
int ans;
void dfs1(int y){
	if(y==n){
      ++ans;
      return;
            }
  for(int x=0;x<n;++x){
  	if(!isValidQueenPosition(y,x))continue;
  	update(y,x,true);
    dfs1(y+1);
    update(y,x,false);
  }
}
*/

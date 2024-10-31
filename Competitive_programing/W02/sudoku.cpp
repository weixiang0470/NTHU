#include <bits/stdc++.h>

using namespace std;

int grid[9][9];
int row[9],col[9];
int subgrids[3][3];
const int MASK = (1<<10)-2;
void print(){
	for(int i=0;i<9;++i){
    	for(int j=0;j<9;++j){
        	cout<<__lg(grid[i][j]);
        }
    }
  	cout<<endl;
}

void update(int r,int c,int num){
	row[r] ^= num;
  	col[c] ^= num;
  	subgrids[r/3][c/3] ^= num;
}

/*bool illegal(int r,int c,int num){
	return (row[r] | col[c] | subgrids[r/3][c/3]) & num;
}*/
int lowbit(int x){return x & -x;}
bool dfs(int idx){
	if(idx==81){return true;}
  	int r=idx/9,c=idx%9;
  	if(grid[r][c])return dfs(idx+1);
  	int S = MASK & ~(row[r] | col[c] | subgrids[r/3][c/3]);
  	for(int num=0 ; S ; S ^= num){
    	//if((num & S)==0)continue;
      	num = lowbit(S);
      	grid[r][c] = num;
      	//print();
      	update(r,c,num);
      	if(dfs(idx+1))return true;
      	update(r,c,num);
    }
  	grid[r][c] =0;
  	return false;
}
void clear_r_c_subgrids(){
	memset(row,0,sizeof(row));
	memset(col,0,sizeof(col));
	memset(subgrids,0,sizeof(subgrids));
}
int main(void){
	string buffer;
  	while(cin>>buffer && buffer!="end"){
    	//cin>>buffer;
      	clear_r_c_subgrids();
      	for(int i=0;i<81;++i){
        	if(isdigit(buffer[i])){
              	grid[i/9][i%9] = 1<<(buffer[i]-'0');
              	update(i/9,i%9,grid[i/9][i%9]);
              
            }
          	else {
              grid[i/9][i%9] = 0;
            }
        }
      	if(dfs(0))print();
      else cout<<"No solution."<<endl;
      	//cout<<buffer<<endl;
    }
}

/* No optimize version
#include <bits/stdc++.h>

using namespace std;

int grid[81];
int grid2[9][9];
bool row[9][10],col[9][10];
bool subgrids[3][3][10];

void print1(){
	for(int i=0;i<81;++i){
    	cout << grid[i];
    }
  	cout<<endl;
}
void print2(){
	for(int i=0;i<9;++i){
    	for(int j=0;j<9;++j){
        	cout<<grid2[i][j];
        }
    }
  	cout<<endl;
}

bool illegal(int r,int c,int num){
	return row[r][num] || col[c][num] || subgrids[r/3][c/3][num];
}

void update(int r,int c,int num, bool val){
	row[r][num] = val;
  	col[c][num] = val;
  	subgrids[r/3][c/3][num] = val;
}
bool dfs(int idx){
	if(idx==81){return true;}
  	int r=idx/9,c=idx%9;
  	if(grid2[r][c])return dfs(idx+1);
  	for(int num=1 ; num<=9; ++num){
    	if(illegal(r,c,num))continue;
      	grid2[r][c] = num;
      	update(r,c,num,true);
      	if(dfs(idx+1))return true;
      	update(r,c,num,false);
    }
  	grid2[r][c] =0;
  	return false;
}
void clear_r_c_subgrids(){
	memset(row,0,sizeof(row));
	memset(col,0,sizeof(col));
	memset(subgrids,0,sizeof(subgrids));
}
int main(void){
	string buffer;
  	while(cin>>buffer && buffer!="end"){
    	//cin>>buffer;
      	clear_r_c_subgrids();
      	for(int i=0;i<81;++i){
        	if(isdigit(buffer[i])){
            	grid[i] = buffer[i]-'0';
              	grid2[i/9][i%9] = buffer[i]-'0';
              	update(i/9,i%9,grid2[i/9][i%9],true);
            }
          	else {
              grid[i]=0;
              grid2[i/9][i%9] = 0;
            }
        }
      	if(dfs(0))print2();
      	//cout<<buffer<<endl;
    }
}
*/
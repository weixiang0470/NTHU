#include <bits/stdc++.h>

using namespace std;
int areas[5][5];
int citys_num;
int m=0,mn_dis;
vector<int> citys;
vector<int> office(5);
vector<int> Best_office;

void print(){
	for(int i=0;i<5;++i){
    	for(int j=0;j<5;++j){
        	cout<<areas[i][j]<< " \n"[j==4];
        }
    }
}

int dis(){
	int d =0;
  	for(int r=0;r<5;++r){
    	for(int c=0;c<5;++c){
          	int mn=99999999;
          	for(auto iter : office){
            	mn = min(mn,areas[r][c]*(abs(iter/5 -r)+abs(iter%5 - c)));
            }
          	d += mn;
        }
    }
  	return d;
}

void dfs(int depth){
  	if (m==5){
    	int d = dis();
      	if(d<mn_dis){
        	mn_dis = d;
          	Best_office = office;
        }
      	return;
    }
  	if(depth == citys_num)return;
  
  	dfs(depth + 1);
  	office[m++] = citys[depth];
  	dfs(depth + 1);
  	m--;
}

int main(void){
  int test_case;
  cin>>test_case;
  while(test_case--){
    int x,y,population;
    cin >> citys_num;
    
    citys.clear();
    Best_office.clear();
    office.clear();
    office.resize(5);
    if(citys_num<=5){
    	/*for(int i=0;i<5;++i){
        	Best_office.emplace_back(i);
        }*/
      	for(int i=0;i<citys_num;++i){
        	cin>>x>>y>>population;
   			//Best_office.pop_back();
          	citys.emplace_back(5*x+y);
        }
      	sort(citys.begin(),citys.end());
      	for(auto iter : citys){
        	Best_office.emplace_back(iter);
        }
      	
        int ptr = 0;
        for(int i=0;i<(5 - citys_num);i++){
          while(count(Best_office.begin(),Best_office.end(),ptr))ptr++;
          Best_office.emplace_back(ptr);
        }
      	sort(Best_office.begin(),Best_office.end());
        for(int i=0;i<5;++i){
          cout<<Best_office[i]<<" \n"[i==4];
        }
      	/*for(auto iter : Best_office){
        	cout<<iter<<" ";
        }
      	cout<<endl;*/
    }
    else{
      fill(&areas[0][0],&areas[0][0] + sizeof(areas)/sizeof(areas[0][0]),0);
      mn_dis=99999999;
      m=0;
      for(int i=0;i<citys_num;++i){
          cin>>x>>y>>population;
          areas[x][y] = population;
          citys.emplace_back(5*x + y);
      }
      
      dfs(0);
      sort(Best_office.begin(),Best_office.end());
      for(int i=0;i<5;++i){
      	cout<<Best_office[i]<<" \n"[i==4];
      }
      /*for(auto iter : Best_office){
        	cout<<iter<<" ";
        }
      cout<<endl;*/
      //print();
    }
  }
	return 0;
}
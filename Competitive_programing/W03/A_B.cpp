#include <bits/stdc++.h>
#define RIGHT 0
#define DOWN 1

using namespace std;

typedef long long int ll;

ll k;
int m,n;
typedef pair<ll,bool> step; //use a pair(long long int:bool) called step
priority_queue<step,vector<step>,greater<step>> ppq; // a priority queue's type to store is step,use vector to store, greater value will go behind
ll red=0,blue=0,purple=0;//Alice:red,Bob:blue,lap:purple, red will same with blue
bool A = RIGHT;
bool B = DOWN;
const int dr[2] = {0,1}; // Move in row(right)
const int dc[2] = {1,0}; // Mode in column(down)
pair <ll,ll> pA = {1,1}; // Alice starting point
pair <ll,ll> pB = {1,1}; // Bob starting point

ll get_overlap(ll t){
	// Same direction
  	if(A==B){
    	if(pA.first==pB.first && pA.second==pB.second)return t;
      	return 0;
    }
  	// Different direction
  	// if A going right and B goin down
  	if(A==RIGHT){
      	// If B is infront or equal to A
      	// or if A moved and still infront of B => will not have intercept
      	ll pA_f = pA.second + t;
    	if(pB.second<=pA.second || pB.second > pA_f ) return 0;
      	// If A is at up or equal to B 
      	// or after B move and still at above of A
      	ll pB_f = pB.first + t;
      	if(pA.first<=pB.first || pA.first > pB_f) return 0;
      	return 1; //else they will have 1 intercept
    }
  	// A going down and B going right
  	// Comparing row(up down)
  	ll pA_f = pA.first + t;
  	if(pB.first<=pA.first || pB.first > pA_f )return 0;
  	// Comparing column(left right)
  	ll pB_f = pB.second + t;
  	if(pA.second<=pB.second || pA.second > pB_f)return 0;
  	return 1;
}

int main(void){
//Alice : n : ->
//Bob : m : |
	cin >> k;
  	cin >> n >> m;
  	ll tmp;
  	for(int i=0;i<n;i++){
    	cin >> tmp;
      	ppq.emplace(tmp,0);
    }
  	for(int i=0;i<n;i++){
    	cin >> tmp;
      	ppq.emplace(tmp,1);
    }
  
  	ppq.emplace(k+1,0);
  	ll last = 1;

  	while(ppq.size()){
    	ll t = ppq.top().first;
      	bool turn = ppq.top().second;
      	ppq.pop();
      	//ll moved = (t-last);
      	ll lap = get_overlap(t - last);
      	purple += lap;
      	red += (t - last - lap);
      	blue += (t - last - lap);
      	pA.first += dr[A] * (t - last);
      	pA.second += dc[A] * (t - last);
      	pB.first += dr[B] * (t - last);
      	pB.second += dc[B] * (t - last);
      	last = t;
      	if(turn)B = !B;
      	else A=!A;
    }
  	cout << red << " " << blue << " " << purple;  
}
#include <bits/stdc++.h>

using namespace std;
int cnt=0;

void Hanoi(int n,int a,int b, int c){
  	cnt++;
	if(n==1){
    	cout<<a<<" "<<c<<"\n";
      	return;
    }
	Hanoi(n-1,a,c,b);
  	Hanoi(1,a,b,c);
  	Hanoi(n-1,b,a,c);
}


int main(void){
  	int n;
  	cin >> n;
  	cout<<pow(2,n)-1<<"\n";
  	Hanoi(n,1,2,3);
	return 0;
}
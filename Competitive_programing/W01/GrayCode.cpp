#include <iostream>
using namespace std;

int bina_arr[17]={0};
int gray_arr[17]={0};
int n;
void print(){
  for(int i=0;i<n;i++){
    cout<<gray_arr[i];
  }
  cout<<"\n";
}
void graycode(int n){
  int n2=pow(2,n);
  print();
  --n2;
  while(n2>0){
    bina_arr[n-1]++;
    for(int i=n-1;i>0;i--){
      if(bina_arr[i]>1){
        bina_arr[i]=0;
        bina_arr[i-1]++;
      }
    }
    gray_arr[0]=bina_arr[0];
    for(int i=0;i<n;i++){
      if(bina_arr[i]==bina_arr[i+1])gray_arr[i+1]=0;
      else gray_arr[i+1]=1;
    }
    print();
    --n2;
  }
  
}

int main(void){
  int digits=0;
  int num;
  cin >> n;
  if(n==1)cout<<0<<"\n"<<1<<"\n";
  graycode(n);
  return 0;
}
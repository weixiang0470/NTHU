#include <iostream>
#include <string.h>
using namespace std;

//bool move=false;
bool Rings[1000];
//Remove/Hook n, we need n-1 hooked, 1~n-2 removed
void ChineseRing(int RingNum,const char* io){
    //cout<<RingNum<<"\n";
    if(RingNum<0)return;
    if(RingNum==0){
        cout<<"Move ring "<<RingNum+1<<" "<<io<<" \n";
        if(io=="out")Rings[RingNum]=0;
        else Rings[RingNum]=1;
        
        return;
    }
    // if(RingNum==1){
    //     if(Rings[RingNum-1]){
    //         cout<<"Move ring "<<RingNum+1<<" "<<io<<" \n";
    //         if(io=="out")Rings[RingNum]=0;
    //         else Rings[RingNum]=1;
    //     }
    //     else {
    //         ChineseRing(RingNum-1,"in");
    //         //Rings[RingNum-1]=1;
    //     }
    // }
    if(io == "out"){
        //cout<<"out\n";
            for(int i=RingNum-2;i>=0;i--){
            if(Rings[i])ChineseRing(i,"out");
        }
        if(Rings[RingNum-1]);
        else ChineseRing(RingNum-1,"in");
        cout<<"Move ring "<<RingNum+1<<" out\n";
        Rings[RingNum]=0;
    }
    else if (io=="in"){
        //cout<<"in\n";
        for(int i=0;i<=RingNum-2;i++){
            if(Rings[i])ChineseRing(i,"out");
        }
        if(Rings[RingNum-1]);
        else ChineseRing(RingNum-1,"in");
        cout<<"Move ring "<<RingNum+1<<" in\n";
        Rings[RingNum]=1;
    }
    // //for(int i=0);
    // ChineseRing(RingNum -2);
    // ChineseRing(RingNum -1);
    // cout<<"Move ring1 "<<RingNum<<" out\n";
    // // 
    ChineseRing(RingNum-1,"out");
    return;
}

int main(void){
    int n;
    
    cin>>n;
    for(int i=0;i<n;++i)Rings[i]=1;
    // if(n<=0)return 0;
    // else if(n<=1){
    //     cout<<"Move ring "<<n<<" out\n";
    //     Rings[n-1]=0;
    //     return 0;
    // }
    // else if(n<=2){
    //     cout<<"Move ring "<<n<<" out\n";
    //     Rings[n-1]=0;
    //     cout<<"Move ring "<<n-1<<" out\n";
    //     Rings[n-2]=0;
    //     return 0;
    // }
    ChineseRing(n-1,"out");
}
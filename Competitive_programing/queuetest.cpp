#include <iostream>
#include <queue>

using namespace std;

priority_queue<int,vector<int>> ppq;

int main(void){
    int count =0;

    for (int i=1;i<=5;++i){
        ppq.emplace(i);
    }

    while(ppq.size()){
        cout<<ppq.size()<<endl;
        ppq.pop();
        cout <<ppq.size()<<endl;
        count++;

    }
    cout<<"count:"<<count<<endl;
}
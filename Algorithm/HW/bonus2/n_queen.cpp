#include <iostream>
#include <string>
using namespace std;
int MASK;
int ans;
void dfs(int M, int L, int R);
int lowbit(int x) { return x & -x; }
void dfs(int M, int L, int R) {
    if (M == MASK) {
        ++ans;
        return;
    }
    int Legal = MASK & ~(M | L | R);
    for (int num = 0; Legal; Legal ^= num) {
        num = lowbit(Legal);
        dfs(M | num, (L | num) << 1, (R | num) >> 1);
    }
}

int main(int argc, char* argv[]) {
    int n = 0;
    n = stoi(argv[1]);
    MASK = (1 << n) - 1;
    dfs(0, 0, 0);
    cout << ans << endl;
    return 0;
}

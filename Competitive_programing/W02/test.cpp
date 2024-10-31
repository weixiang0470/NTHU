#include <iostream>
using namespace std;

int mask, n, target;
int stick[20];

int lg(int x) {
    return log2(x);
}
int lowbit(int x) {
    return x & -x;
}

bool dfs(int used, int length, int last) {
    //cout << used << ", " << mask << endl;
    if (used == mask) return true;
    if (last == n) return false;
    int block = mask - (1 << last) + 1;
    int S = (block & ~used), idx;
    cout<< " mask: " << bitset<8>(mask)<<endl;
    cout << " block: " << bitset<8>(block)<<endl;
    char c;
    //cin >> c;
    for (int num = 0; S; S ^= num) {
        num = lowbit(S);
        idx = lg(num);
        //cout << "FINDING: " << idx << endl;
        int nl = stick[idx] + length;
        if (nl > target) continue;
        if (nl == target && dfs(used | num, 0, 0)) return true;
        if (dfs(used | num, nl, idx+1)) return true;
    }
    return false;
}

int main() {
    int t;
    cin >> t;
    while (t--) {
        int sum = 0;
        cin >> n;
        for (int i = 0; i < n; i++) {
            cin >> stick[i];
            sum += stick[i];
        }
        mask = (1 << n) - 1;
        target = sum / 4;
        if ((sum % 4) || !dfs(0, 0, 0)) cout << "no\n";
        else cout << "yes\n";
    }
}

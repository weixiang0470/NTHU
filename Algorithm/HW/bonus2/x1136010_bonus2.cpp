#include <iostream>
#include <string>
#include <queue>
using namespace std;

int MASK;
int ans;

int lowbit(int x) { return x & -x; }

int main(int argc, char* argv[]) {
    int n = 0;
    n = stoi(argv[1]);
    MASK = (1 << n) - 1;

    // BFS initialization
    queue<tuple<int, int, int>> q;
    q.push({0, 0, 0});  // Start with the initial state (M=0, L=0, R=0)
    
    while (!q.empty()) {
        // Dequeue the front state (M, L, R)
        auto [M, L, R] = q.front();
        q.pop();
        
        if (M == MASK) {
            ++ans;  // Found a valid configuration, increment the result
            continue;
        }
        
        // Calculate the legal moves
        int Legal = MASK & ~(M | L | R);
        for (int num = 0; Legal; Legal ^= num) {
            num = lowbit(Legal);
            // Enqueue the next state after applying the move
            q.push({M | num, (L | num) << 1, (R | num) >> 1});
        }
    }

    // Output the result
    cout << ans << endl;
    return 0;
}

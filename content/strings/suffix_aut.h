#include <bits/stdc++.h>
using namespace std;

struct SUFFIX_AUTOMATON{
    struct STATE{
        bool is_clone;
        int link, len, cnt, first_pos;
        vector<int> next;
    };
    int N, sz, last;
    vector<STATE> st;
    void init(int N){
        this -> N = N;
        st.assign(2 * N, {false, 0, 0, 0, 0, vector<int>(26, 0)});
        st[0].link = -1;
        sz = 1;
        last = 0;
    }
    void extend(char c){
        c -= 'a';
        int cur = sz ++, par = last;
        st[cur].first_pos = st[last].len;
        st[cur].len = st[last].len + 1;
        st[cur].cnt = 1;
        while(par != -1 && !st[par].next[c]){
            st[par].next[c] = cur;
            par = st[par].link;
        }
        if(par == -1) st[cur].link = 0;
        else{
            int que = st[par].next[c];
            if(st[par].len + 1 == st[que].len) st[cur].link = que;
            else{
                int clone = sz ++;
                st[clone] = st[que];
                st[clone].cnt = 0;
                st[clone].is_clone = true;
                st[clone].len = st[par].len + 1;
                while(par != -1 && st[par].next[c] == que){
                    st[par].next[c] = clone;
                    par = st[par].link;
                }
                st[que].link = clone;
                st[cur].link = clone;
            }
        }
        last = cur;
    }
};
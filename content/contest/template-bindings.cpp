/**
 * Author: Matei Tinca
 * Date: 2025-10-26
 * License: CC0
 * Source: My own templates, idk.
 * Description: mf will do anything to avoid using namespace std.
 * Usage:
 * Time:
 * Memory:
 * Status: Untested
 */
#include <bits/stdc++.h>

template<typename T, int N>
struct NDVector { using type = std::vector<typename NDVector<T, N - 1>::type>; };
template<typename T>
struct NDVector<T, 1> { using type = std::vector<T>; };

template<typename T, int N>
using Tensor = typename NDVector<T, N>::type;

template<typename T>
std::vector<T> create_tensor(int N) { return std::vector<T>(N); }
template<typename T, typename... ArgTypes>
Tensor<T, sizeof...(ArgTypes) + 1> create_tensor(int N, ArgTypes... args) {
  auto under = create_tensor<T>(args...);
  return std::vector(N, under);
}

template<typename T> using Vector = Tensor<T, 1>;
template<typename T> using Matrix = Tensor<T, 2>;

int main() {
    std::cin.tie(NULL);
    std::iostream::sync_with_stdio(false);

    return 0;
}

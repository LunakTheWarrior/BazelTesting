#include <algorithm>
#include <iostream>
#include <array>
#include <cstdint>



int main()
{
    std::array<std::uint32_t, 10> tabellen{};

    std::fill(tabellen.begin(), tabellen.end(), 42);

    for (const auto element : tabellen)
    {
        std::cout << element << "\n";
    }

    return 0;
}
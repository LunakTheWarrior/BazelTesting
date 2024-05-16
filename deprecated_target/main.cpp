#include <iostream>
#include <custom_math.h>
#include <util.hpp>


int main()
{
    std::cout << "Hello the sum is: "
            << sum(42,42) << " \nSome string: " << getSomeString()
            << std::endl;
    return 0;
}
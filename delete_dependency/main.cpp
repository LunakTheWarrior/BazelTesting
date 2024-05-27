#include <iostream>
#include <some_stuff.h>

int main()
{
    std::cout << "halla verden" << std::endl;
    //const auto tall = theStuff();
    //Sizes measured: with stat bazel-bin/program
    //10952 - with linker script to remove theStuff()
    //8368 - Without linker script
    //8448 - Without linker script but with theStuff() in main.cpp
    return 0;
}
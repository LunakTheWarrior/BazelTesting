#include <gtest/gtest.h>
#include <custom_math.h>
#include <cstdint>


TEST(math_suite, add)
{
    constexpr std::uint64_t expected{42};
    EXPECT_EQ(add(10, 32), expected);
}
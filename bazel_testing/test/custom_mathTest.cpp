#include <gtest/gtest.h>
#include <custom_math.h>

TEST(custom_math, sum)
{
    EXPECT_EQ(sum(42,42), 84);
}
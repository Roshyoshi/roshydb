#include "roshydb/version.hpp"

#include <gtest/gtest.h>

TEST(VersionTest, ReportsInitialProjectVersion) {
  EXPECT_EQ(roshydb::version(), "0.1.0");
}

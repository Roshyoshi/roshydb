#include "roshydb/version.hpp"

#include <iostream>
#include <string_view>

namespace {

void print_usage(std::ostream& output) {
  output << "usage: roshydb [--help] [--version]\n";
}

} // namespace

int main(int argc, char** argv) {
  if (argc > 2) {
    print_usage(std::cerr);
    return 2;
  }

  if (argc == 2) {
    const std::string_view arg{argv[1]};

    if (arg == "--help" || arg == "-h") {
      print_usage(std::cout);
      return 0;
    }

    if (arg == "--version" || arg == "-v") {
      std::cout << "roshydb " << roshydb::version() << '\n';
      return 0;
    }

    std::cerr << "unknown option: " << arg << '\n';
    print_usage(std::cerr);
    return 2;
  }

  std::cout << "roshydb " << roshydb::version() << '\n';
  return 0;
}

# roshydb

`roshydb` is a C++26 project scaffolded with Autotools, GoogleTest, and a Nix
flake for reproducible development and package builds.

## Development

Enter the development shell:

```sh
nix develop
```

Build and test with Autotools:

```sh
./bootstrap
./configure
make
make check
```

Build the Nix package:

```sh
nix build
```

## Layout

- `include/roshydb/` contains public headers.
- `src/` contains the library implementation and CLI.
- `tests/` contains GoogleTest tests.
- `m4/` contains Autotools macro support.

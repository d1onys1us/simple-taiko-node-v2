# build the crates
build:
  cargo build

# start the docs dev server
docs:
  @cd docs && bun run dev

# run the kittynode cli with the given args
kittynode *args:
  target/debug/kittynode {{args}}

# publish the crates
publish-crates:
  cargo publish -p kittynode-core && cargo publish -p kittynode-cli

# start the tauri dev app
tauri:
  @cd apps/kittynode-gui/kittynode-tauri && cargo tauri dev

# build the tauri app for macOS
tauri-build-apple:
  @cd apps/kittynode-gui/kittynode-tauri && cargo tauri build --target aarch64-apple-darwin

# build the tauri app for Linux
tauri-build-linux:
  @cd apps/kittynode-gui/kittynode-tauri && cargo tauri build --target x86_64-unknown-linux-gnu

# run the tests
test:
  cargo nextest run

# run the tests with coverage
test-coverage:
  cargo llvm-cov nextest

# run the tests without capturing output
test-no-capture:
  cargo nextest run --no-capture

# write the changelog
write-changelog:
  git cliff --bump -o

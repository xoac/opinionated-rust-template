
# Guard for running just without args. just list recipes
recipes-list:
    just --list

# Update README.md from source-code documentaion
readme-gnerate:
    cargo readme > README.md

# Check code and README.md updates
check:
    cargo clippy --all-targets --all-features --workspace -- -D warnings
    cargo fmt --all -- --check
    bash -c "diff --brief <(cargo readme) README.md" # It's error to check documentation without update README.md

# Check and test code
test: check
    cargo test

# Clean and update dependencies in Cargo.lock
clean-and-update:
    cargo clean
    cargo update

# Try push changes to origin but check for typical errors
test-and-push: test
    cargo deny check 
    git push

# Check and push (use test-and-push) instead!
check-and-push: check
    cargo deny check
    git push

# Load version from Cargo.toml
version := `sed -En 's/version[[:space:]]*=[[:space:]]*"([^"]+)"/\1/p' Cargo.toml | head -1`
{% assign tag_version = "{{ version }}" %}
# create version tag and push to origin
tag-version: clean-and-update test
    cargo deny check
    grep -Fq '[{{ tag_version }}]' CHANGELOG.md                  # The CHANGELOG.md should contains updated changes
    git diff --no-ext-diff --quiet --exit-code              # All files should be committed 
    git tag -a {{ tag_version }} -m "Release {{ tag_version }}"
    git push origin {{ tag_version }}

# crate tag push it to origin and then publish to crates.io
tag-and-publish: tag-version
    cargo publish


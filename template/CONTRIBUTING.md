# Contribution guidelines

First off, thank you for considering contributing to {{project-name}}.

If your contribution is not straightforward, please first discuss the change you
wish to make by creating a new issue before making the change.

## Reporting issues

Before reporting an issue on the
[issue tracker](https://github.com/{{gh-username}}/{{project-name}}/issues),
please check that it has not already been reported by searching for some related
keywords.

## Pull requests

Try to do one pull request per change.

### Updating the changelog

Update the changes you have made in
[CHANGELOG](https://github.com/{{gh-username}}/{{project-name}}/blob/main/CHANGELOG.md)
file under the **Unreleased** section.

Add the changes of your pull request to one of the following subsections,
depending on the types of changes defined by
[Keep a changelog](https://keepachangelog.com/en/1.0.0/):

- `Added` for new features.
- `Changed` for changes in existing functionality.
- `Deprecated` for soon-to-be removed features.
- `Removed` for now removed features.
- `Fixed` for any bug fixes.
- `Security` in case of vulnerabilities.

If the required subsection does not exist yet under **Unreleased**, create it!

## Developing

### Set up

This is no different than other Rust projects.

```shell
git clone {{ repository }}
cd {{git-project-name}}
cargo test
```

If you are new to Rust best place to start will be [Learn Rust](https://www.rust-lang.org/learn)

### Useful Commands

This project use `.justfile` to define useful commands. You can see all commands with descriptions
if you type `just --list`. Installation instruction can be found on [just github](https://github.com/casey/just#installation).

This project use `deny.toml` to increase project security and legality. To check if restriction are fulfilled call `cargo deny`. For installation instruction and more details about cargo deny visit it [github page](https://github.com/EmbarkStudios/cargo-deny).

This project use `cargo readme` to avoid duplication between `README.md` and project documentation in `src/lib.rs` or `src/main.rs`.
To update `README.md` call `cargo readme > README.md`. or find ready command with `just --list`. For installation and more details about cargo readme visit it [github page](https://github.com/livioribeiro/cargo-readme).

### Useful resources

    1. [Rust API Guidelines](https://rust-lang.github.io/api-guidelines/)

# {{project-name}}

[![Crates.io](https://img.shields.io/crates/v/{{project-name}}.svg)](https://crates.io/crates/{{project-name}})
[![Docs.rs](https://docs.rs/{{project-name}}/badge.svg)](https://docs.rs/{{project-name}})
{% if ci-type == "github-actions" -%}
[![CI]({{repository}}/workflows/CI/badge.svg)]({{repository}}/actions)
{% endif -%}
[![Coverage Status](https://coveralls.io/repos/github/{{github-organization}}/{{git-project-name}}/badge.svg?branch=main)](https://coveralls.io/github/{{github-organization}}/{{git-project-name}}?branch=main)

{% raw %}{{readme}}{% endraw %}

## Installation
{% if crate_type == "lib" %}
### Library
Add as dependency in `Cargo.toml`
```toml
[dependencies]
{{project-name}} = {% raw %}"{{version}}"{% endraw %}
```
{% elsif crate_type == "bin" %}
### Cargo

* Install the rust toolchain in order to have cargo installed by following
  [this](https://www.rust-lang.org/tools/install) guide.
* run `cargo install {{project-name}}`
{% endif -%}

## License

Licensed under Boost Software License - Version 1.0 [BSL-1.0](LICENSE) or https://www.boost.org/LICENSE_1_0.txt

## Contribution

Unless you explicitly state otherwise, any contribution intentionally submitted
for inclusion in the work by you, as defined in the BSL-1.0 license, should not contains 
any additional terms or conditions.

See [CONTRIBUTING.md](CONTRIBUTING.md).


<!--
Manual template render test:
Variables:
repository: `{{repository}}`
ci-type: `{{ci-type}}`
git-user: `{{git-user}}`
git-server: `{{git-server}}`

-->

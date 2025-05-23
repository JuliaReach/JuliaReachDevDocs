# JuliaReachDevDocs

| **Documentation** | **Status** | **Community** | **License** |
|:-----------------:|:----------:|:-------------:|:-----------:|
| [![docs-dev][dev-img]][dev-url] | [![CI][ci-img]][ci-url] [![aqua][aqua-img]][aqua-url] [![dev-commits][dev-commits-url]][dev-commits-target] | [![zulip][chat-img]][chat-url] | [![license][lic-img]][lic-url] |

[dev-img]: https://img.shields.io/badge/docs-latest-blue.svg
[dev-url]: https://juliareach.github.io/JuliaReachDevDocs/dev/
[ci-img]: https://github.com/JuliaReach/JuliaReachDevDocs/actions/workflows/test-master.yml/badge.svg
[ci-url]: https://github.com/JuliaReach/JuliaReachDevDocs/actions/workflows/test-master.yml
[aqua-img]: https://raw.githubusercontent.com/JuliaTesting/Aqua.jl/master/badge.svg
[aqua-url]: https://github.com/JuliaTesting/Aqua.jl
[dev-commits-url]: https://img.shields.io/github/commits-since/JuliaReach/JuliaReachDevDocs/latest.svg
[dev-commits-target]: https://github.com/JuliaReach/JuliaReachDevDocs
[chat-img]: https://img.shields.io/badge/zulip-join_chat-brightgreen.svg
[chat-url]: https://julialang.zulipchat.com/#narrow/stream/278609-juliareach
[lic-img]: https://img.shields.io/github/license/mashape/apistatus.svg
[lic-url]: https://github.com/JuliaReach/JuliaReachDevDocs/blob/master/LICENSE

`JuliaReachDevDocs` hosts resources for JuliaReach org developers.

## Resources

- [Contents](https://juliareach.github.io/JuliaReachDevDocs/latest/#Contents-1)
- [About](https://juliareach.github.io/JuliaReachDevDocs/latest/about/)

## How to edit the dev docs

To contribute to `JuliaReachDevDocs`, you can either modify in the online GitHub
interface, or fork the repository and push the proposed changes in a new branch.

To build the documentation, use the following command in a command shell:

```bash
$ julia --color=yes docs/make.jl
```

Refer to the [official documentation](https://julialang.org/downloads) on how to
install and run Julia in your system.

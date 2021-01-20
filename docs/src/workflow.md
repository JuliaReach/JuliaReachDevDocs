# Git workflow

This page contains some general information about the recommended workflow
to develop `JuliaReach` projects and some frequently asked questions
& git workflow tips.

```@contents
Pages = ["workflow.md"]
```

## Branches and pull requests (PR)

We use a standard pull request policy:
You work in a private branch and eventually add a pull request, which is then
reviewed by other programmers and merged into the `master` branch.

Each pull request should be pushed in a new branch with the name of the author
followed by a descriptive name, e.g., `mforets/my_feature`.
If the branch is associated to a previous discussion in one issue, we use the
name of the issue for easier lookup, e.g., `mforets/7`.

## Unit testing and continuous integration

This project is synchronized with Travis continuous integration (CI) such that each PR gets tested before
merging (and the build is automatically triggered after each new commit).
For the maintainability of this project, it is important to understand and fix
the failing doctests if they exist.
We develop in Julia v0.6.0, but for experimentation we also build on the nightly
branch.

When you modify code in this package, you should make sure that all unit tests
pass.
To run the unit tests locally, you should do:

```
$ julia --color=yes test/runtests.jl
```

Alternatively, you can achieve the same from inside the REPL using the following
command:

```julia
julia> using Pkg
julia> Pkg.test("MathematicalSets")
```

We also advise adding new unit tests when adding new features to ensure
long-term support of your contributions.

## Contributing to the documentation

New functions and types should be documented according to our
[guidelines](https://github.com/JuliaReach/LazySets.jl/wiki/Documentation-Guidelines)
directly in the source code.

You can view the source code documentation from inside the REPL by typing `?`
followed by the name of the type or function.
For example, the following command will print the documentation of the `AbstractSet`
type:

```julia
julia> ?AbstractSet
```

This documentation you are currently reading is written in Markdown, and it
relies on [Documenter.jl](https://juliadocs.github.io/Documenter.jl/stable/) to
produce the HTML layout.
The sources for creating this documentation are found in `docs/src`.
You can easily include the documentation that you wrote for your functions or
types there (see the
[Documenter.jl guide](https://juliadocs.github.io/Documenter.jl/stable/man/guide/)
or our sources for examples).

To generate the documentation locally, run `make.jl`, e.g., by executing the
following command in the terminal:

```
$ julia --color=yes docs/make.jl
```

Note that this also runs all doctests which will take some time.

## Reviewing a pull request from a fork

To pull a PR numbered `x` from a fork, do

```
$ git fetch origin pull/x/head:pr/x && git checkout pr/x
```

## Contributing from a fork

It is not uncommon that user A wants to contribute to package X and A doesn't
have write access to X. In that case, the usual procedure is that A creates a fork
of X, and then creates a PR to be merged by the maintainer of package X.
You have to properly setup the branches to do so:

- `origin`   -- is usually set to the fork of the project
- `upstream` -- is usually set to the main project

For example, suppose that user `mforets` would like to setup the pacakge `Polyhedra`
working from a fork. The git command `git remote -v` prints all the remote repositories,
and you can modify them with `git remote add` to add a new one and
`git remote set-url` to change the URL of an existing repository (it also possible to
manually edit the file `.git/config`). In the example:

```
[mforets@localhost dev]$ cd Polyhedra

[mforets@localhost Polyhedra]$ git remote -v
origin  https://github.com/JuliaPolyhedra/Polyhedra.jl.git (fetch)
origin  https://github.com/JuliaPolyhedra/Polyhedra.jl.git (push)

[mforets@localhost Polyhedra]$ git remote add upstream https://github.com/JuliaPolyhedra/Polyhedra.jl.git

[mforets@localhost Polyhedra]$ git remote set-url origin https://github.com/mforets/Polyhedra.jl.git

[mforets@localhost Polyhedra]$ git remote -v
origin  https://github.com/mforets/Polyhedra.jl.git (fetch)
origin  https://github.com/mforets/Polyhedra.jl.git (push)

upstream        https://github.com/JuliaPolyhedra/Polyhedra.jl.git (fetch)
upstream        https://github.com/JuliaPolyhedra/Polyhedra.jl.git (push)
```

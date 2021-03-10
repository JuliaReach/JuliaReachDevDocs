# Adding a new package

In this section we describe the usual procedure to add a new package.

```@contents
Pages = ["newpkg.md"]
Depth = 3
```

## Creating the github repository

To create an empty repository, go to your user name and click on `New`. If you have write access to the [JuliaReach](http://juliareach.org) org, click on `New` on the top-right or go to the link [Create a new repository](https://github.com/organizations/JuliaReach/repositories/new).

## Creating the Julia package

### Using `JuliaReachTemplatePkg`

The github repository [JuliaReachTemplatePkg](https://github.com/JuliaReach/JuliaReachTemplatePkg)
contains a template package for JuliaReach projects.

### Using `PkgTemplates`

Alternatively, an easy way to create an empty package is to use
[PkgTemplates](https://github.com/invenia/PkgTemplates.jl).
An example is given below:

```julia
julia> using PkgTemplates

julia> t = Template(; user="JuliaReach", license="MIT",
                      authors=["Marcelo Forets", "Benoît Legat", "Christian Schilling"],
                      plugins=[TravisCI(), Codecov(), AppVeyor(), GitHubPages()])

julia> generate("MathematicalSets", t)
```

Some settings are used in JuliaReach's projects:

- update the README
- add the style for docs in `docs/assets/juliareach.css`

## Deploying the documentation

Follow the guidelines described in
[Documenter.jl's manual: Hosting documentation](https://juliadocs.github.io/Documenter.jl/stable/man/hosting/).
In particular, copy the Documenter key from
[here](https://juliadocs.github.io/Documenter.jl/stable/man/hosting/).

After the first build, set up (i.e., protect, see below) the `gh-pages` branch
and add links to the documentation in the `README.md`.

## Integrating the repository with gitter

Github uses [Webhooks](https://developer.github.com/webhooks/) to set up GitHub
Apps which subscribe to certain events on github repositories.
To integrate your newly created package under `https://github.com/JuliaReach`
with the main gitter channel `https://gitter.im/JuliaReach/Lobby`, just copy the
Gitter *Webhook* from an existing repository.
(No integration in Gitter itself is needed; see
[this FAQ](https://gitlab.com/gitlab-org/gitter/webapp/blob/develop/docs/faq.md#what-happens-if-i-rename-something-on-github-org-repo) for details.)

Repositories outside the `JuliaReach` domain require more work on Gitter's side:

1. In gitter, go to *Room settings*, then click on *Integrations*.

2. Select *Add an integration (Github)*.

3. You may be asked to grant write access.

4. In the tab *Pick which repositories you want to subscribe to:*, select the
new created project.

## Adding Travis builds

- Copy the Travis *Webhook* from an existing repository.
- The *GitHub App* (under *Settings/Integrations & services*) is already set up
for the `JuliaReach` organization.
- Copy and adapt the file `.travis.yml` from this repository.

## Adding requirements

These are links we have found useful:

- [Testing specific dependencies](https://julialang.github.io/Pkg.jl/dev/creating-packages/#Test-specific-dependencies-1)
- [Getting a valid uuid](https://discourse.julialang.org/t/pkg-api-for-getting-uuid-of-another-package/15061/2):

```julia
julia> using Pkg

julia> Pkg.METADATA_compatible_uuid("LazySets")
UUID("b4f0291d-fe17-52bc-9479-3d1a343d9043")
```

## Adding code coverage

Enable [codecov](https://codecov.io/) in the `.travis.yml` file:

```julia
codecov: true
language: julia
...
```

## Adding members

Add members with the corresponding access rights under *Settings/Manage access*.

## Protecting branches

Add rules for branch protection under *Settings/Branches* for the `master` and
`gh-pages` branches (copy them from an existing repository).

## Publishing packages

- Install JuliaTeam Registrator (under *Settings/Integrations & services*).
- Copy the file `.github/workflows/TagBot.yml` from an existing repository.

## Reduce repo size

The page  https://github.com/settings/repositories lists each repo size.

To cleanup past docs preview folders, see [clean-gh-pages.yml](https://raw.githubusercontent.com/JuliaReach/NeuralNetworkAnalysis.jl/master/.github/workflows/clean-gh-pages.yml).

That works but it only removes the last preview for the current PR. And if the PR is closed before the preview is pushed, that run errors and does not remove the folder. To remove all previews from the history, one can do this locally:

```
git rm -rf "previews/PR*"
git commit -m "delete previews"
git branch gh-pages-new $(echo "delete history" | git commit-tree HEAD^{tree})
git push --force origin gh-pages-new:gh-pages
git checkout master
git branch -D gh-pages gh-pages-new
```

Something that can also help to shrink the local git size (especially after this change): `git gc`.

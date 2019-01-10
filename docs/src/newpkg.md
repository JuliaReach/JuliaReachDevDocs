```@contents
Pages = ["newpkg.md"]
Depth = 3
```

# Adding a New Package

## Creating the github repository

To create an empty repository, go to your user name and click on `New`. If you have write access to the [JuliaReach](http://juliareach.org) org, click on `New` on the top-right or go to the link [Create a new repository](https://github.com/organizations/JuliaReach/repositories/new).

## Creating the Julia package 

An easy way to create an empty package is to use [PkgTemplates](https://github.com/invenia/PkgTemplates.jl). An example is given below:

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

## Integrating the repository with gitter

Github uses [Webhooks](https://developer.github.com/webhooks/) to set up GitHub Apps which subscribe to certain events on github repositories. To make your newly created package under `https://github.com/JuliaReach` to be integrated with the main gitter channel `https://gitter.im/JuliaReach/Lobby`, do the following steps:

1. In gitter, go to *Room settings*, then click on *Integrations*.

2. Select *Add an integration (Github)*.

3. You may be asked to grant write access.

4. In the tab *Pick which repositories you want to subscribe to:*, select the new created project.


!!! note

    If the project is hosted under the org, gitter should have been granted write access to it; see [this FAQ](https://gitlab.com/gitlab-org/gitter/webapp/blob/develop/docs/faq.md#what-happens-if-i-rename-something-on-github-org-repo) for details.

## Adding requirements

These are links we have found useful:

- [Testing specific dependencies](https://julialang.github.io/Pkg.jl/dev/creating-packages/#Test-specific-dependencies-1)
- [Getting a valid uuid](https://discourse.julialang.org/t/pkg-api-for-getting-uuid-of-another-package/15061/2)

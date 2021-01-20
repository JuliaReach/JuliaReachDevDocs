# Creating a new release

This is a short step-by-step manual on how to make a new release of a package.

```@contents
Pages = ["release.md"]
Depth = 3
```

## Choosing a new release version

First you have to choose whether you want to create a *patch* release, a *minor*
release, or a *major* release.

* Major releases are very rare cases for major breaking changes in the API,
  which should typically be avoided.
* Minor releases are used when some dependency has changed (e.g., a new
  dependency was added), a mild breaking change in the API was added, or some
  important feature was added.
* Patch releases are used for everything else.

For more information, check [Semantic Versioning](https://semver.org/).


## Preparing the release

Edit the file `Project.toml` and change the version number of the package to the
new version. Make a new pull request and wait until CI passes and the PR gets merged.


## Creating a new release

Choose the appropriate subsection for this step and locate the release notes.
Usually we keep the release notes in the wiki part of the project
("Release-log tracker").
These release notes correspond to the development version of the package until
the next release.


### Creating a new release on General (Julia ecosystem packages only)

If the package is released in the Julia ecosystem, a pull request to
[`General`](https://github.com/JuliaRegistries/General) has to be made to make
new versions available.
[`Registrator`](https://juliaregistrator.github.io/) is used for this purpose.
Find the issue named `Releases` in the issue tracker and write the following
comment.

    @JuliaRegistrator register()

This will let `Registrator` trigger a pull request to `General`.
Check that everything works there and then wait until the pull request gets
merged.
Then the [`TagBot`](https://github.com/apps/julia-tagbot) will create a new
release on Github.
Finally, you need to manually write the release notes for that release.


### Creating a new release on Github

If the package is not released in the Julia ecosystem, you can just manually
create a release on Github with the corresponding release notes.


## Clean up the release log

Finally, remove the items from the release log in the wiki (keep the headlines,
though).

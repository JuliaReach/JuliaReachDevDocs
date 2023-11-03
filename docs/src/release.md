# Releases and bots

This is a short step-by-step manual on how to make a new release of a package.
In the process of maintaining a package, updating dependencies, etc.,
there are some "bots" (services) that are commonly used in Julia projects. Those
are also mentioned in this section.

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

## Compatibility bot

The Julia package [CompatHelper.jl](https://github.com/JuliaRegistries/CompatHelper.jl)
can be used to automatically update the `[compat]` entries for your Julia package's
dependencies. It is easy to install; just create and edit the file
`.github/workflows/CompatHelper.yml` as described in `CompatHelper.jl`'s documentation.
Once installed, this github action will automatically create PRs to update compatibility
bounds of the dependencies of the package.

## Registrator bot

The [Registrator.jl](https://github.com/JuliaRegistries/Registrator.jl) bot is a
github app that automates creation of registration pull requests for your Julia packages
to the General registry. To install, just click on the installation button that can be
found on `Registrator.jl`'s documentation. Once installed, the usual procedure to
register a new release is:

The procedure for registering a new package is the same as for releasing a new version.

- Set your project's `Project.toml` version field in your repository to your new desired version.

- Comment `@JuliaRegistrator register` on the commit/branch you want to register.

- Either rely on the TagBot GitHub Action to tag and make a github release automatically
  (recommended, see [Tag bot](@ref) below) or alternatively tag the release manually.

## Tag bot

The [TagBot](https://github.com/JuliaRegistries/TagBot) github action is used to
automatically create tags, releases, and changelogs for your Julia packages when they're
registered. It is easy to install; just create and edit the file
`.github/workflows/TagBot.yml` as described in `TagBot`'s documentation.
Once installed, this github action will automatically create a release and tag a release
log each time the package was registered using `JuliaRegistrator @register`.

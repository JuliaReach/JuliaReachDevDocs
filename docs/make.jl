using Documenter, JuliaReachDevDocs

makedocs(;
    doctest = false,
    format = :html,
    pages = [
        "Home" => "index.md",
        "Adding a New Package" => "newpkg.md",
        "Coding Guidelines" => "guidelines.md",
        "About" => "about.md"
    ],
    repo="https://github.com/JuliaReach/JuliaReachDevDocs/blob/{commit}{path}#L{line}",
    sitename="JuliaReachDevDocs",
    authors="Marcelo Forets, Christian Schilling",
    assets = ["assets/juliareach.css"],
)

deploydocs(;
    repo="github.com/JuliaReach/JuliaReachDevDocs",
    target="build",
    deps=nothing,
    make=nothing
)

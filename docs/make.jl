using Documenter

makedocs(;
    doctest = false,
    format = :html,
    pages = [
        "Home" => "index.md",
        "Adding a New Package" => "newpkg.md",
        "Writing Documentation" => "guidelines.md",
        "About" => "about.md"
    ],
    repo="https://github.com/JuliaReach/JuliaReachDevDocs.jl/blob/{commit}{path}#L{line}",
    sitename="JuliaReachDevDocs.jl",
    authors="Marcelo Forets, Christian Schilling",
    assets = ["assets/juliareach.css"],
)

deploydocs(;
    repo="github.com/JuliaReach/JuliaReachDevDocs.jl",
    target="build",
    deps=nothing,
    make=nothing,
    julia="1.0"
)

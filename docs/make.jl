using Documenter

makedocs(;
    doctest = false,
    format = :html,
    pages = [
        "Home" => "index.md",
        "Adding a new JuliaReach package" => "newpkg.md",
        "Documentation Guidelines" => Any[
            "Generating the docs" => "guidelines/generating.md",
            "Mathematical notation" => "guidelines/math.md",
            "Writing docstrings" => "guidelines/docstrings.md",
            "Additional guidelines" => "guidelines/extras.md",
            "Writing doctests" => "guidelines/doctests.md",
            "Cross references" => "guidelines/crossrefs.md"
            ],
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

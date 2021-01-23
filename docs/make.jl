using Documenter, JuliaReachDevDocs

DocMeta.setdocmeta!(JuliaReachDevDocs, :DocTestSetup,
                    :(using JuliaReachDevDocs); recursive=true)

makedocs(;
    sitename = "JuliaReachDevDocs",
    authors = "Marcelo Forets, Christian Schilling",
    modules = [JuliaReachDevDocs],
    format = Documenter.HTML(
        prettyurls = get(ENV, "CI", nothing) == "true",
        assets = ["assets/juliareach.css"]),
    pages = [
        "Home" => "index.md",
        "Adding a new package" => "newpkg.md",
        "Git workflow" => "workflow.md",
        "Releases and bots" => "release.md",
        "Coding guidelines" => "guidelines.md",
        "About" => "about.md"
    ],
    strict = true
)

deploydocs(
    repo = "github.com/JuliaReach/JuliaReachDevDocs",
    push_preview = true
)

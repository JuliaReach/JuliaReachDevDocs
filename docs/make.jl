using Documenter, JuliaReachDevDocs

DocMeta.setdocmeta!(JuliaReachDevDocs, :DocTestSetup,
                    :(using JuliaReachDevDocs); recursive=true)

makedocs(;
    sitename = "JuliaReachDevDocs",
    modules = [JuliaReachDevDocs],
    format = Documenter.HTML(
        prettyurls = get(ENV, "CI", nothing) == "true",
        assets = ["assets/aligned.css"]),
    strict = true,
    pages = [
        "Home" => "index.md",
        "Adding a new package" => "newpkg.md",
        "Git workflow" => "workflow.md",
        "Releases and bots" => "release.md",
        "Coding guidelines" => "guidelines.md",
        "About" => "about.md"
    ]
)

deploydocs(
    repo = "github.com/JuliaReach/JuliaReachDevDocs",
    push_preview = true
)

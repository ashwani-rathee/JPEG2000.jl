using JPEG2000
using Documenter

format = Documenter.HTML(
    prettyurls = get(ENV, "CI", nothing) == "true"
)

makedocs(;
    modules=[JPEG2000],
    sitename="JPEG2000.jl",
    format=format,
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/ashwani-rathee/JPEG2000.jl",
    devbranch="master",
)
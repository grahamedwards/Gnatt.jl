using Gnatt
using Documenter

DocMeta.setdocmeta!(Gnatt, :DocTestSetup, :(using Gnatt); recursive=true)

makedocs(;
    modules=[Gnatt],
    authors="Graham Harper Edwards",
    sitename="Gnatt.jl",
    format=Documenter.HTML(;
        canonical="https://grahamedwards.github.io/Gnatt.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/grahamedwards/Gnatt.jl",
    devbranch="main",
)

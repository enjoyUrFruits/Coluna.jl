using Documenter, Coluna, Literate, BlockDecomposition, Parameters

TUTORIAL_GAP = joinpath(@__DIR__, "src", "start", "start.jl")
TUTORIAL_CUTS = joinpath(@__DIR__, "src", "start", "cuts.jl")
TUTORIAL_PRICING = joinpath(@__DIR__, "src", "start", "pricing.jl")
TUTORIAL_CUSTOMDATA = joinpath(@__DIR__, "src", "start", "custom_data.jl")
TUTORIAL_INITCOLS = joinpath(@__DIR__, "src", "start", "initial_columns.jl")
TUTORIAL_ADVANCED = joinpath(@__DIR__, "src", "start", "advanced_demo.jl")
TUTORIAL_TREESEARCH_API = joinpath(@__DIR__, "src", "api", "treesearch.jl")
TUTORIAL_STORAGE_API = joinpath(@__DIR__, "src", "api", "storage.jl")

OUTPUT_GAP = joinpath(@__DIR__, "src", "start")
OUTPUT_CUTS = joinpath(@__DIR__, "src", "start")
OUTPUT_PRICING = joinpath(@__DIR__, "src", "start")
OUTPUT_CUSTOMDATA = joinpath(@__DIR__, "src", "start")
OUTPUT_INITCOLS = joinpath(@__DIR__, "src", "start")
OUTPUT_ADVANCED = joinpath(@__DIR__, "src", "start")
OUTPUT_TREESEARCH_API = joinpath(@__DIR__, "src", "api")
OUTPUT_STORAGE_API = joinpath(@__DIR__, "src", "api")

Literate.markdown(TUTORIAL_GAP, OUTPUT_GAP, documenter=true)
Literate.markdown(TUTORIAL_CUTS, OUTPUT_CUTS, documenter=true)
Literate.markdown(TUTORIAL_PRICING, OUTPUT_PRICING, documenter=true)
Literate.markdown(TUTORIAL_CUSTOMDATA, OUTPUT_CUSTOMDATA, documenter=true)
Literate.markdown(TUTORIAL_INITCOLS, OUTPUT_INITCOLS, documenter=true)
Literate.markdown(TUTORIAL_ADVANCED, OUTPUT_ADVANCED, documenter=true)
Literate.markdown(TUTORIAL_TREESEARCH_API, OUTPUT_TREESEARCH_API, documenter=true)
Literate.markdown(TUTORIAL_STORAGE_API, OUTPUT_STORAGE_API, documenter=true)

makedocs(
    modules = [Coluna, BlockDecomposition],
    checkdocs = :exports,
    sitename = "Coluna User Guide",
    authors = "Atoptima & contributors",
    format = Documenter.HTML(
        prettyurls = get(ENV, "CI", nothing) == "true",
        collapselevel = 1,
        assets = ["assets/js/init.js"]
    ),
    strict = false,
    pages = Any[
        "Introduction"   => "index.md",
        "Getting started"  => Any[
            "Column generation" => joinpath("start", "start.md"),
            "Valid inequalities" => joinpath("start", "cuts.md"),
            "Pricing callback" => joinpath("start", "pricing.md"),
            "Custom data" => joinpath("start", "custom_data.md"),
            "Initial columns callback" => joinpath("start", "initial_columns.md"),
            "Advanced tutorial" => joinpath("start", "advanced-demo.md"),
        ],
        "Manual" => Any[
            "Decomposition" => joinpath("man", "decomposition.md"),
            "Configuration" => joinpath("man", "config.md"),
            "Algorithms" => joinpath("man", "algorithm.md"),
            "Callbacks"   => joinpath("man", "callbacks.md"),
        ],
        "API" => Any[
            "Branching" => joinpath("api", "branching.md"),
            "ColGen" => joinpath("api", "colgen.md"),
            "TreeSearch" => joinpath("api", "treesearch.md"),
            "Storage" => joinpath("api", "storage.md"),
        ],
        "Dynamic Sparse Arrays" => "dynamic_sparse_arrays.md",
        "Q&A" => "qa.md",
    ]
)

deploydocs(
    repo = "github.com/atoptima/Coluna.jl.git",
    push_preview = true
)

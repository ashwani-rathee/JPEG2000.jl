using Clang.JLLEnvs
using Clang.Generators
using libopenjpegextra_jll

include_dir = normpath(libopenjpegextra_jll.artifact_dir, "include")
headers = [joinpath(include_dir, header) for header in readdir(include_dir) if endswith(header, ".h")]
options = load_options(joinpath(@__DIR__, "generator2.toml"))

args =   get_default_args()
push!(args, "-I$include_dir")

ctx = create_context(headers, args, options)

build!(ctx)
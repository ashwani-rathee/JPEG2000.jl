using Clang.JLLEnvs
using Clang.Generators
using libopenjpegextra_jll


include_dir = normpath(libopenjpegextra_jll.artifact_dir, "include")
include_dir2 = normpath(OpenJpeg_jll.artifact_dir, "include/openjpeg-2.4")
headers2 = [joinpath(include_dir, header) for header in readdir(include_dir) if endswith(header, ".h")]
headers = [joinpath(include_dir2, header) for header in readdir(include_dir2) if endswith(header, ".h")]
append!(headers, headers2)
options = load_options(joinpath(@__DIR__, "generator2.toml"))

args =   get_default_args()
push!(args, "-I$include_dir")

ctx = create_context(headers, args, options)

build!(ctx)
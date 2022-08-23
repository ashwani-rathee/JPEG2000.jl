module JPEG2000

include("../lib/LibOpenJpeg.jl")
include("../lib/LibOpenJpegExtra.jl")

using .LibOpenJpeg
using .LibOpenJpegExtra
using FixedPointNumbers
using ImageBase

include("decode.jl")

export jpeg2000_decode

end # module

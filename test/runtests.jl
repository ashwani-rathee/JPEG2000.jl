using JPEG2000
using JPEG2000.LibOpenJpeg
using Test
using Downloads
using ColorTypes

_wrap(name) = "https://github.com/ashwani-rathee/jpeg2000-sampleimages/blob/main/$(name)?raw=true"
get_example(x) = Downloads.download(_wrap(x))

@testset "JPEG2000.jl" begin
    @test size(jpeg2000_decode(get_example("sample1.jp2"))) == (3701, 2717)
end
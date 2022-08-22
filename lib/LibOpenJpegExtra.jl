module LibOpenJpegExtra

using libopenjpegextra_jll
export libopenjpegextra_jll

using CEnum

struct rgbdata
    r::Ptr{Cint}
    g::Ptr{Cint}
    b::Ptr{Cint}
end

const rgb = rgbdata

function convert_gray_to_rgb(original)
    ccall((:convert_gray_to_rgb, libopenjpegextra), Ptr{Cint}, (Ptr{Cint},), original)
end

function encode(filename, image)
    ccall((:encode, libopenjpegextra), Cint, (Ptr{Cchar}, Ptr{Cint}), filename, image)
end

function decode(filename)
    ccall((:decode, libopenjpegextra), Ptr{Cint}, (Ptr{Cchar},), filename)
end

function imagetorgbbuffer(image)
    ccall((:imagetorgbbuffer, libopenjpegextra), rgb, (Ptr{Cint},), image)
end

function rgbbuffertoimage(original, buf)
    ccall((:rgbbuffertoimage, libopenjpegextra), Ptr{Cint}, (Ptr{Cint}, rgb), original, buf)
end

end # module

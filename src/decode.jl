

function jpeg2000_decode(filepath::AbstractString)
    a = LibOpenJpegExtra.decode(filepath)
    if(a==C_NULL)
        error("Failed to read the file.")
    end
    c = unsafe_load(a)
    b = LibOpenJpegExtra.imagetorgbbuffer(a)
    a1 = unsafe_wrap(Array, b.r, c.x1*c.y1)
    a2 = unsafe_wrap(Array, b.g, c.x1*c.y1)
    a3 = unsafe_wrap(Array, b.b, c.x1*c.y1)
    im = colorview(RGB, N0f8.(a1/255), N0f8.(a2/255), N0f8.(a3/255))
    img1 = reshape(im, c.x1, c.y1)'
    return img1
end

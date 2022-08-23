module LibOpenJpegExtra
libopenjpegextra = "./../lib/libopenjpegextra.so"

# using libopenjpegextra_jll
# export libopenjpegextra_jll

using CEnum
const OPJ_INT32 = Int32

const OPJ_BOOL = Cint

const OPJ_CHAR = Cchar

const OPJ_FLOAT32 = Cfloat

const OPJ_FLOAT64 = Cdouble

const OPJ_BYTE = Cuchar

const OPJ_INT8 = Int8

const OPJ_UINT8 = UInt8

const OPJ_INT16 = Int16

const OPJ_UINT16 = UInt16

const OPJ_UINT32 = UInt32

const OPJ_INT64 = Int64

const OPJ_UINT64 = UInt64

const OPJ_OFF_T = Int64

const OPJ_SIZE_T = Csize_t

@cenum RSIZ_CAPABILITIES::UInt32 begin
    OPJ_STD_RSIZ = 0
    OPJ_CINEMA2K = 3
    OPJ_CINEMA4K = 4
    OPJ_MCT = 33024
end

const OPJ_RSIZ_CAPABILITIES = RSIZ_CAPABILITIES

@cenum CINEMA_MODE::UInt32 begin
    OPJ_OFF = 0
    OPJ_CINEMA2K_24 = 1
    OPJ_CINEMA2K_48 = 2
    OPJ_CINEMA4K_24 = 3
end

const OPJ_CINEMA_MODE = CINEMA_MODE

@cenum PROG_ORDER::Int32 begin
    OPJ_PROG_UNKNOWN = -1
    OPJ_LRCP = 0
    OPJ_RLCP = 1
    OPJ_RPCL = 2
    OPJ_PCRL = 3
    OPJ_CPRL = 4
end

const OPJ_PROG_ORDER = PROG_ORDER

@cenum COLOR_SPACE::Int32 begin
    OPJ_CLRSPC_UNKNOWN = -1
    OPJ_CLRSPC_UNSPECIFIED = 0
    OPJ_CLRSPC_SRGB = 1
    OPJ_CLRSPC_GRAY = 2
    OPJ_CLRSPC_SYCC = 3
    OPJ_CLRSPC_EYCC = 4
    OPJ_CLRSPC_CMYK = 5
end

const OPJ_COLOR_SPACE = COLOR_SPACE

@cenum CODEC_FORMAT::Int32 begin
    OPJ_CODEC_UNKNOWN = -1
    OPJ_CODEC_J2K = 0
    OPJ_CODEC_JPT = 1
    OPJ_CODEC_JP2 = 2
    OPJ_CODEC_JPP = 3
    OPJ_CODEC_JPX = 4
end

const OPJ_CODEC_FORMAT = CODEC_FORMAT

# typedef void ( * opj_msg_callback ) ( const char * msg , void * client_data )
const opj_msg_callback = Ptr{Cvoid}

struct opj_poc
    resno0::OPJ_UINT32
    compno0::OPJ_UINT32
    layno1::OPJ_UINT32
    resno1::OPJ_UINT32
    compno1::OPJ_UINT32
    layno0::OPJ_UINT32
    precno0::OPJ_UINT32
    precno1::OPJ_UINT32
    prg1::OPJ_PROG_ORDER
    prg::OPJ_PROG_ORDER
    progorder::NTuple{5, OPJ_CHAR}
    tile::OPJ_UINT32
    tx0::OPJ_INT32
    tx1::OPJ_INT32
    ty0::OPJ_INT32
    ty1::OPJ_INT32
    layS::OPJ_UINT32
    resS::OPJ_UINT32
    compS::OPJ_UINT32
    prcS::OPJ_UINT32
    layE::OPJ_UINT32
    resE::OPJ_UINT32
    compE::OPJ_UINT32
    prcE::OPJ_UINT32
    txS::OPJ_UINT32
    txE::OPJ_UINT32
    tyS::OPJ_UINT32
    tyE::OPJ_UINT32
    dx::OPJ_UINT32
    dy::OPJ_UINT32
    lay_t::OPJ_UINT32
    res_t::OPJ_UINT32
    comp_t::OPJ_UINT32
    prc_t::OPJ_UINT32
    tx0_t::OPJ_UINT32
    ty0_t::OPJ_UINT32
end

const opj_poc_t = opj_poc

struct opj_cparameters
    tile_size_on::OPJ_BOOL
    cp_tx0::Cint
    cp_ty0::Cint
    cp_tdx::Cint
    cp_tdy::Cint
    cp_disto_alloc::Cint
    cp_fixed_alloc::Cint
    cp_fixed_quality::Cint
    cp_matrice::Ptr{Cint}
    cp_comment::Ptr{Cchar}
    csty::Cint
    prog_order::OPJ_PROG_ORDER
    POC::NTuple{32, opj_poc_t}
    numpocs::OPJ_UINT32
    tcp_numlayers::Cint
    tcp_rates::NTuple{100, Cfloat}
    tcp_distoratio::NTuple{100, Cfloat}
    numresolution::Cint
    cblockw_init::Cint
    cblockh_init::Cint
    mode::Cint
    irreversible::Cint
    roi_compno::Cint
    roi_shift::Cint
    res_spec::Cint
    prcw_init::NTuple{33, Cint}
    prch_init::NTuple{33, Cint}
    infile::NTuple{4096, Cchar}
    outfile::NTuple{4096, Cchar}
    index_on::Cint
    index::NTuple{4096, Cchar}
    image_offset_x0::Cint
    image_offset_y0::Cint
    subsampling_dx::Cint
    subsampling_dy::Cint
    decod_format::Cint
    cod_format::Cint
    jpwl_epc_on::OPJ_BOOL
    jpwl_hprot_MH::Cint
    jpwl_hprot_TPH_tileno::NTuple{16, Cint}
    jpwl_hprot_TPH::NTuple{16, Cint}
    jpwl_pprot_tileno::NTuple{16, Cint}
    jpwl_pprot_packno::NTuple{16, Cint}
    jpwl_pprot::NTuple{16, Cint}
    jpwl_sens_size::Cint
    jpwl_sens_addr::Cint
    jpwl_sens_range::Cint
    jpwl_sens_MH::Cint
    jpwl_sens_TPH_tileno::NTuple{16, Cint}
    jpwl_sens_TPH::NTuple{16, Cint}
    cp_cinema::OPJ_CINEMA_MODE
    max_comp_size::Cint
    cp_rsiz::OPJ_RSIZ_CAPABILITIES
    tp_on::Cchar
    tp_flag::Cchar
    tcp_mct::Cchar
    jpip_on::OPJ_BOOL
    mct_data::Ptr{Cvoid}
    max_cs_size::Cint
    rsiz::OPJ_UINT16
end

const opj_cparameters_t = opj_cparameters

struct opj_dparameters
    cp_reduce::OPJ_UINT32
    cp_layer::OPJ_UINT32
    infile::NTuple{4096, Cchar}
    outfile::NTuple{4096, Cchar}
    decod_format::Cint
    cod_format::Cint
    DA_x0::OPJ_UINT32
    DA_x1::OPJ_UINT32
    DA_y0::OPJ_UINT32
    DA_y1::OPJ_UINT32
    m_verbose::OPJ_BOOL
    tile_index::OPJ_UINT32
    nb_tile_to_decode::OPJ_UINT32
    jpwl_correct::OPJ_BOOL
    jpwl_exp_comps::Cint
    jpwl_max_tiles::Cint
    flags::Cuint
end

const opj_dparameters_t = opj_dparameters

const opj_codec_t = Ptr{Cvoid}

# typedef OPJ_SIZE_T ( * opj_stream_read_fn ) ( void * p_buffer , OPJ_SIZE_T p_nb_bytes , void * p_user_data )
const opj_stream_read_fn = Ptr{Cvoid}

# typedef OPJ_SIZE_T ( * opj_stream_write_fn ) ( void * p_buffer , OPJ_SIZE_T p_nb_bytes , void * p_user_data )
const opj_stream_write_fn = Ptr{Cvoid}

# typedef OPJ_OFF_T ( * opj_stream_skip_fn ) ( OPJ_OFF_T p_nb_bytes , void * p_user_data )
const opj_stream_skip_fn = Ptr{Cvoid}

# typedef OPJ_BOOL ( * opj_stream_seek_fn ) ( OPJ_OFF_T p_nb_bytes , void * p_user_data )
const opj_stream_seek_fn = Ptr{Cvoid}

# typedef void ( * opj_stream_free_user_data_fn ) ( void * p_user_data )
const opj_stream_free_user_data_fn = Ptr{Cvoid}

const opj_stream_t = Ptr{Cvoid}

struct opj_image_comp
    dx::OPJ_UINT32
    dy::OPJ_UINT32
    w::OPJ_UINT32
    h::OPJ_UINT32
    x0::OPJ_UINT32
    y0::OPJ_UINT32
    prec::OPJ_UINT32
    bpp::OPJ_UINT32
    sgnd::OPJ_UINT32
    resno_decoded::OPJ_UINT32
    factor::OPJ_UINT32
    data::Ptr{OPJ_INT32}
    alpha::OPJ_UINT16
end

const opj_image_comp_t = opj_image_comp

struct opj_image
    x0::OPJ_UINT32
    y0::OPJ_UINT32
    x1::OPJ_UINT32
    y1::OPJ_UINT32
    numcomps::OPJ_UINT32
    color_space::OPJ_COLOR_SPACE
    comps::Ptr{opj_image_comp_t}
    icc_profile_buf::Ptr{OPJ_BYTE}
    icc_profile_len::OPJ_UINT32
end

const opj_image_t = opj_image

struct opj_image_comptparm
    dx::OPJ_UINT32
    dy::OPJ_UINT32
    w::OPJ_UINT32
    h::OPJ_UINT32
    x0::OPJ_UINT32
    y0::OPJ_UINT32
    prec::OPJ_UINT32
    bpp::OPJ_UINT32
    sgnd::OPJ_UINT32
end

const opj_image_cmptparm_t = opj_image_comptparm

struct opj_packet_info
    start_pos::OPJ_OFF_T
    end_ph_pos::OPJ_OFF_T
    end_pos::OPJ_OFF_T
    disto::Cdouble
end

const opj_packet_info_t = opj_packet_info

struct opj_marker_info
    type::Cushort
    pos::OPJ_OFF_T
    len::Cint
end

const opj_marker_info_t = opj_marker_info

struct opj_tp_info
    tp_start_pos::Cint
    tp_end_header::Cint
    tp_end_pos::Cint
    tp_start_pack::Cint
    tp_numpacks::Cint
end

const opj_tp_info_t = opj_tp_info

struct opj_tile_info
    thresh::Ptr{Cdouble}
    tileno::Cint
    start_pos::Cint
    end_header::Cint
    end_pos::Cint
    pw::NTuple{33, Cint}
    ph::NTuple{33, Cint}
    pdx::NTuple{33, Cint}
    pdy::NTuple{33, Cint}
    packet::Ptr{opj_packet_info_t}
    numpix::Cint
    distotile::Cdouble
    marknum::Cint
    marker::Ptr{opj_marker_info_t}
    maxmarknum::Cint
    num_tps::Cint
    tp::Ptr{opj_tp_info_t}
end

const opj_tile_info_t = opj_tile_info

struct opj_codestream_info
    D_max::Cdouble
    packno::Cint
    index_write::Cint
    image_w::Cint
    image_h::Cint
    prog::OPJ_PROG_ORDER
    tile_x::Cint
    tile_y::Cint
    tile_Ox::Cint
    tile_Oy::Cint
    tw::Cint
    th::Cint
    numcomps::Cint
    numlayers::Cint
    numdecompos::Ptr{Cint}
    marknum::Cint
    marker::Ptr{opj_marker_info_t}
    maxmarknum::Cint
    main_head_start::Cint
    main_head_end::Cint
    codestream_size::Cint
    tile::Ptr{opj_tile_info_t}
end

const opj_codestream_info_t = opj_codestream_info

struct opj_tccp_info
    compno::OPJ_UINT32
    csty::OPJ_UINT32
    numresolutions::OPJ_UINT32
    cblkw::OPJ_UINT32
    cblkh::OPJ_UINT32
    cblksty::OPJ_UINT32
    qmfbid::OPJ_UINT32
    qntsty::OPJ_UINT32
    stepsizes_mant::NTuple{97, OPJ_UINT32}
    stepsizes_expn::NTuple{97, OPJ_UINT32}
    numgbits::OPJ_UINT32
    roishift::OPJ_INT32
    prcw::NTuple{33, OPJ_UINT32}
    prch::NTuple{33, OPJ_UINT32}
end

const opj_tccp_info_t = opj_tccp_info

struct opj_tile_v2_info
    tileno::Cint
    csty::OPJ_UINT32
    prg::OPJ_PROG_ORDER
    numlayers::OPJ_UINT32
    mct::OPJ_UINT32
    tccp_info::Ptr{opj_tccp_info_t}
end

const opj_tile_info_v2_t = opj_tile_v2_info

struct opj_codestream_info_v2
    tx0::OPJ_UINT32
    ty0::OPJ_UINT32
    tdx::OPJ_UINT32
    tdy::OPJ_UINT32
    tw::OPJ_UINT32
    th::OPJ_UINT32
    nbcomps::OPJ_UINT32
    m_default_tile_info::opj_tile_info_v2_t
    tile_info::Ptr{opj_tile_info_v2_t}
end

const opj_codestream_info_v2_t = opj_codestream_info_v2

struct opj_tp_index
    start_pos::OPJ_OFF_T
    end_header::OPJ_OFF_T
    end_pos::OPJ_OFF_T
end

const opj_tp_index_t = opj_tp_index

struct opj_tile_index
    tileno::OPJ_UINT32
    nb_tps::OPJ_UINT32
    current_nb_tps::OPJ_UINT32
    current_tpsno::OPJ_UINT32
    tp_index::Ptr{opj_tp_index_t}
    marknum::OPJ_UINT32
    marker::Ptr{opj_marker_info_t}
    maxmarknum::OPJ_UINT32
    nb_packet::OPJ_UINT32
    packet_index::Ptr{opj_packet_info_t}
end

const opj_tile_index_t = opj_tile_index

struct opj_codestream_index
    main_head_start::OPJ_OFF_T
    main_head_end::OPJ_OFF_T
    codestream_size::OPJ_UINT64
    marknum::OPJ_UINT32
    marker::Ptr{opj_marker_info_t}
    maxmarknum::OPJ_UINT32
    nb_of_tiles::OPJ_UINT32
    tile_index::Ptr{opj_tile_index_t}
end

const opj_codestream_index_t = opj_codestream_index

struct opj_jp2_metadata
    not_used::OPJ_INT32
end

const opj_jp2_metadata_t = opj_jp2_metadata

struct opj_jp2_index
    not_used::OPJ_INT32
end

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
    ccall((:decode, libopenjpegextra), Ptr{opj_image_t}, (Ptr{Cchar},), filename)
end

function imagetorgbbuffer(image)
    ccall((:imagetorgbbuffer, libopenjpegextra), rgb, (Ptr{Cint},), image)
end

function rgbbuffertoimage(original, buf)
    ccall((:rgbbuffertoimage, libopenjpegextra), Ptr{Cint}, (Ptr{Cint}, rgb), original, buf)
end

end # module

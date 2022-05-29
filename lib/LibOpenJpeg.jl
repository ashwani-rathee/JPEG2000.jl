module LibOpenJpeg

using OpenJpeg_jll
export OpenJpeg_jll

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

const opj_jp2_index_t = opj_jp2_index

function opj_version()
    ccall((:opj_version, libopenjpeg), Ptr{Cchar}, ())
end

function opj_image_create(numcmpts, cmptparms, clrspc)
    ccall((:opj_image_create, libopenjpeg), Ptr{opj_image_t}, (OPJ_UINT32, Ptr{opj_image_cmptparm_t}, OPJ_COLOR_SPACE), numcmpts, cmptparms, clrspc)
end

function opj_image_destroy(image)
    ccall((:opj_image_destroy, libopenjpeg), Cvoid, (Ptr{opj_image_t},), image)
end

function opj_image_tile_create(numcmpts, cmptparms, clrspc)
    ccall((:opj_image_tile_create, libopenjpeg), Ptr{opj_image_t}, (OPJ_UINT32, Ptr{opj_image_cmptparm_t}, OPJ_COLOR_SPACE), numcmpts, cmptparms, clrspc)
end

function opj_image_data_alloc(size)
    ccall((:opj_image_data_alloc, libopenjpeg), Ptr{Cvoid}, (OPJ_SIZE_T,), size)
end

function opj_image_data_free(ptr)
    ccall((:opj_image_data_free, libopenjpeg), Cvoid, (Ptr{Cvoid},), ptr)
end

function opj_stream_default_create(p_is_input)
    ccall((:opj_stream_default_create, libopenjpeg), Ptr{opj_stream_t}, (OPJ_BOOL,), p_is_input)
end

function opj_stream_create(p_buffer_size, p_is_input)
    ccall((:opj_stream_create, libopenjpeg), Ptr{opj_stream_t}, (OPJ_SIZE_T, OPJ_BOOL), p_buffer_size, p_is_input)
end

function opj_stream_destroy(p_stream)
    ccall((:opj_stream_destroy, libopenjpeg), Cvoid, (Ptr{opj_stream_t},), p_stream)
end

function opj_stream_set_read_function(p_stream, p_function)
    ccall((:opj_stream_set_read_function, libopenjpeg), Cvoid, (Ptr{opj_stream_t}, opj_stream_read_fn), p_stream, p_function)
end

function opj_stream_set_write_function(p_stream, p_function)
    ccall((:opj_stream_set_write_function, libopenjpeg), Cvoid, (Ptr{opj_stream_t}, opj_stream_write_fn), p_stream, p_function)
end

function opj_stream_set_skip_function(p_stream, p_function)
    ccall((:opj_stream_set_skip_function, libopenjpeg), Cvoid, (Ptr{opj_stream_t}, opj_stream_skip_fn), p_stream, p_function)
end

function opj_stream_set_seek_function(p_stream, p_function)
    ccall((:opj_stream_set_seek_function, libopenjpeg), Cvoid, (Ptr{opj_stream_t}, opj_stream_seek_fn), p_stream, p_function)
end

function opj_stream_set_user_data(p_stream, p_data, p_function)
    ccall((:opj_stream_set_user_data, libopenjpeg), Cvoid, (Ptr{opj_stream_t}, Ptr{Cvoid}, opj_stream_free_user_data_fn), p_stream, p_data, p_function)
end

function opj_stream_set_user_data_length(p_stream, data_length)
    ccall((:opj_stream_set_user_data_length, libopenjpeg), Cvoid, (Ptr{opj_stream_t}, OPJ_UINT64), p_stream, data_length)
end

function opj_stream_create_default_file_stream(fname, p_is_read_stream)
    ccall((:opj_stream_create_default_file_stream, libopenjpeg), Ptr{opj_stream_t}, (Ptr{Cchar}, OPJ_BOOL), fname, p_is_read_stream)
end

function opj_stream_create_file_stream(fname, p_buffer_size, p_is_read_stream)
    ccall((:opj_stream_create_file_stream, libopenjpeg), Ptr{opj_stream_t}, (Ptr{Cchar}, OPJ_SIZE_T, OPJ_BOOL), fname, p_buffer_size, p_is_read_stream)
end

function opj_set_info_handler(p_codec, p_callback, p_user_data)
    ccall((:opj_set_info_handler, libopenjpeg), OPJ_BOOL, (Ptr{opj_codec_t}, opj_msg_callback, Ptr{Cvoid}), p_codec, p_callback, p_user_data)
end

function opj_set_warning_handler(p_codec, p_callback, p_user_data)
    ccall((:opj_set_warning_handler, libopenjpeg), OPJ_BOOL, (Ptr{opj_codec_t}, opj_msg_callback, Ptr{Cvoid}), p_codec, p_callback, p_user_data)
end

function opj_set_error_handler(p_codec, p_callback, p_user_data)
    ccall((:opj_set_error_handler, libopenjpeg), OPJ_BOOL, (Ptr{opj_codec_t}, opj_msg_callback, Ptr{Cvoid}), p_codec, p_callback, p_user_data)
end

function opj_create_decompress(format)
    ccall((:opj_create_decompress, libopenjpeg), Ptr{opj_codec_t}, (OPJ_CODEC_FORMAT,), format)
end

function opj_destroy_codec(p_codec)
    ccall((:opj_destroy_codec, libopenjpeg), Cvoid, (Ptr{opj_codec_t},), p_codec)
end

function opj_end_decompress(p_codec, p_stream)
    ccall((:opj_end_decompress, libopenjpeg), OPJ_BOOL, (Ptr{opj_codec_t}, Ptr{opj_stream_t}), p_codec, p_stream)
end

function opj_set_default_decoder_parameters(parameters)
    ccall((:opj_set_default_decoder_parameters, libopenjpeg), Cvoid, (Ptr{opj_dparameters_t},), parameters)
end

function opj_setup_decoder(p_codec, parameters)
    ccall((:opj_setup_decoder, libopenjpeg), OPJ_BOOL, (Ptr{opj_codec_t}, Ptr{opj_dparameters_t}), p_codec, parameters)
end

function opj_codec_set_threads(p_codec, num_threads)
    ccall((:opj_codec_set_threads, libopenjpeg), OPJ_BOOL, (Ptr{opj_codec_t}, Cint), p_codec, num_threads)
end

function opj_read_header(p_stream, p_codec, p_image)
    ccall((:opj_read_header, libopenjpeg), OPJ_BOOL, (Ptr{opj_stream_t}, Ptr{opj_codec_t}, Ptr{Ptr{opj_image_t}}), p_stream, p_codec, p_image)
end

function opj_set_decoded_components(p_codec, numcomps, comps_indices, apply_color_transforms)
    ccall((:opj_set_decoded_components, libopenjpeg), OPJ_BOOL, (Ptr{opj_codec_t}, OPJ_UINT32, Ptr{OPJ_UINT32}, OPJ_BOOL), p_codec, numcomps, comps_indices, apply_color_transforms)
end

function opj_set_decode_area(p_codec, p_image, p_start_x, p_start_y, p_end_x, p_end_y)
    ccall((:opj_set_decode_area, libopenjpeg), OPJ_BOOL, (Ptr{opj_codec_t}, Ptr{opj_image_t}, OPJ_INT32, OPJ_INT32, OPJ_INT32, OPJ_INT32), p_codec, p_image, p_start_x, p_start_y, p_end_x, p_end_y)
end

function opj_decode(p_decompressor, p_stream, p_image)
    ccall((:opj_decode, libopenjpeg), OPJ_BOOL, (Ptr{opj_codec_t}, Ptr{opj_stream_t}, Ptr{opj_image_t}), p_decompressor, p_stream, p_image)
end

function opj_get_decoded_tile(p_codec, p_stream, p_image, tile_index)
    ccall((:opj_get_decoded_tile, libopenjpeg), OPJ_BOOL, (Ptr{opj_codec_t}, Ptr{opj_stream_t}, Ptr{opj_image_t}, OPJ_UINT32), p_codec, p_stream, p_image, tile_index)
end

function opj_set_decoded_resolution_factor(p_codec, res_factor)
    ccall((:opj_set_decoded_resolution_factor, libopenjpeg), OPJ_BOOL, (Ptr{opj_codec_t}, OPJ_UINT32), p_codec, res_factor)
end

function opj_write_tile(p_codec, p_tile_index, p_data, p_data_size, p_stream)
    ccall((:opj_write_tile, libopenjpeg), OPJ_BOOL, (Ptr{opj_codec_t}, OPJ_UINT32, Ptr{OPJ_BYTE}, OPJ_UINT32, Ptr{opj_stream_t}), p_codec, p_tile_index, p_data, p_data_size, p_stream)
end

function opj_read_tile_header(p_codec, p_stream, p_tile_index, p_data_size, p_tile_x0, p_tile_y0, p_tile_x1, p_tile_y1, p_nb_comps, p_should_go_on)
    ccall((:opj_read_tile_header, libopenjpeg), OPJ_BOOL, (Ptr{opj_codec_t}, Ptr{opj_stream_t}, Ptr{OPJ_UINT32}, Ptr{OPJ_UINT32}, Ptr{OPJ_INT32}, Ptr{OPJ_INT32}, Ptr{OPJ_INT32}, Ptr{OPJ_INT32}, Ptr{OPJ_UINT32}, Ptr{OPJ_BOOL}), p_codec, p_stream, p_tile_index, p_data_size, p_tile_x0, p_tile_y0, p_tile_x1, p_tile_y1, p_nb_comps, p_should_go_on)
end

function opj_decode_tile_data(p_codec, p_tile_index, p_data, p_data_size, p_stream)
    ccall((:opj_decode_tile_data, libopenjpeg), OPJ_BOOL, (Ptr{opj_codec_t}, OPJ_UINT32, Ptr{OPJ_BYTE}, OPJ_UINT32, Ptr{opj_stream_t}), p_codec, p_tile_index, p_data, p_data_size, p_stream)
end

function opj_create_compress(format)
    ccall((:opj_create_compress, libopenjpeg), Ptr{opj_codec_t}, (OPJ_CODEC_FORMAT,), format)
end

function opj_set_default_encoder_parameters(parameters)
    ccall((:opj_set_default_encoder_parameters, libopenjpeg), Cvoid, (Ptr{opj_cparameters_t},), parameters)
end

function opj_setup_encoder(p_codec, parameters, image)
    ccall((:opj_setup_encoder, libopenjpeg), OPJ_BOOL, (Ptr{opj_codec_t}, Ptr{opj_cparameters_t}, Ptr{opj_image_t}), p_codec, parameters, image)
end

function opj_encoder_set_extra_options(p_codec, p_options)
    ccall((:opj_encoder_set_extra_options, libopenjpeg), OPJ_BOOL, (Ptr{opj_codec_t}, Ptr{Ptr{Cchar}}), p_codec, p_options)
end

function opj_start_compress(p_codec, p_image, p_stream)
    ccall((:opj_start_compress, libopenjpeg), OPJ_BOOL, (Ptr{opj_codec_t}, Ptr{opj_image_t}, Ptr{opj_stream_t}), p_codec, p_image, p_stream)
end

function opj_end_compress(p_codec, p_stream)
    ccall((:opj_end_compress, libopenjpeg), OPJ_BOOL, (Ptr{opj_codec_t}, Ptr{opj_stream_t}), p_codec, p_stream)
end

function opj_encode(p_codec, p_stream)
    ccall((:opj_encode, libopenjpeg), OPJ_BOOL, (Ptr{opj_codec_t}, Ptr{opj_stream_t}), p_codec, p_stream)
end

function opj_destroy_cstr_info(cstr_info)
    ccall((:opj_destroy_cstr_info, libopenjpeg), Cvoid, (Ptr{Ptr{opj_codestream_info_v2_t}},), cstr_info)
end

function opj_dump_codec(p_codec, info_flag, output_stream)
    ccall((:opj_dump_codec, libopenjpeg), Cvoid, (Ptr{opj_codec_t}, OPJ_INT32, Ptr{Libc.FILE}), p_codec, info_flag, output_stream)
end

function opj_get_cstr_info(p_codec)
    ccall((:opj_get_cstr_info, libopenjpeg), Ptr{opj_codestream_info_v2_t}, (Ptr{opj_codec_t},), p_codec)
end

function opj_get_cstr_index(p_codec)
    ccall((:opj_get_cstr_index, libopenjpeg), Ptr{opj_codestream_index_t}, (Ptr{opj_codec_t},), p_codec)
end

function opj_destroy_cstr_index(p_cstr_index)
    ccall((:opj_destroy_cstr_index, libopenjpeg), Cvoid, (Ptr{Ptr{opj_codestream_index_t}},), p_cstr_index)
end

function opj_get_jp2_metadata(p_codec)
    ccall((:opj_get_jp2_metadata, libopenjpeg), Ptr{opj_jp2_metadata_t}, (Ptr{opj_codec_t},), p_codec)
end

function opj_get_jp2_index(p_codec)
    ccall((:opj_get_jp2_index, libopenjpeg), Ptr{opj_jp2_index_t}, (Ptr{opj_codec_t},), p_codec)
end

function opj_set_MCT(parameters, pEncodingMatrix, p_dc_shift, pNbComp)
    ccall((:opj_set_MCT, libopenjpeg), OPJ_BOOL, (Ptr{opj_cparameters_t}, Ptr{OPJ_FLOAT32}, Ptr{OPJ_INT32}, OPJ_UINT32), parameters, pEncodingMatrix, p_dc_shift, pNbComp)
end

function opj_has_thread_support()
    ccall((:opj_has_thread_support, libopenjpeg), OPJ_BOOL, ())
end

function opj_get_num_cpus()
    ccall((:opj_get_num_cpus, libopenjpeg), Cint, ())
end

# Skipping MacroDefinition: INLINE __inline__

# Skipping MacroDefinition: OPJ_API __attribute__ ( ( visibility ( "default" ) ) )

# Skipping MacroDefinition: OPJ_LOCAL __attribute__ ( ( visibility ( "hidden" ) ) )

const OPJ_TRUE = 1

const OPJ_FALSE = 0

const OPJ_PATH_LEN = 4096

const OPJ_J2K_MAXRLVLS = 33

const OPJ_J2K_MAXBANDS = 3OPJ_J2K_MAXRLVLS - 2

const OPJ_J2K_DEFAULT_NB_SEGS = 10

const OPJ_J2K_STREAM_CHUNK_SIZE = 0x00100000

const OPJ_J2K_DEFAULT_HEADER_SIZE = 1000

const OPJ_J2K_MCC_DEFAULT_NB_RECORDS = 10

const OPJ_J2K_MCT_DEFAULT_NB_RECORDS = 10

const JPWL_MAX_NO_TILESPECS = 16

const JPWL_MAX_NO_PACKSPECS = 16

const JPWL_MAX_NO_MARKERS = 512

const JPWL_PRIVATEINDEX_NAME = "jpwl_index_privatefilename"

const JPWL_EXPECTED_COMPONENTS = 3

const JPWL_MAXIMUM_TILES = 8192

const JPWL_MAXIMUM_HAMMING = 2

const JPWL_MAXIMUM_EPB_ROOM = 65450

const OPJ_IMG_INFO = 1

const OPJ_J2K_MH_INFO = 2

const OPJ_J2K_TH_INFO = 4

const OPJ_J2K_TCH_INFO = 8

const OPJ_J2K_MH_IND = 16

const OPJ_J2K_TH_IND = 32

const OPJ_JP2_INFO = 128

const OPJ_JP2_IND = 256

const OPJ_PROFILE_NONE = 0x0000

const OPJ_PROFILE_0 = 0x0001

const OPJ_PROFILE_1 = 0x0002

const OPJ_PROFILE_PART2 = 0x8000

const OPJ_PROFILE_CINEMA_2K = 0x0003

const OPJ_PROFILE_CINEMA_4K = 0x0004

const OPJ_PROFILE_CINEMA_S2K = 0x0005

const OPJ_PROFILE_CINEMA_S4K = 0x0006

const OPJ_PROFILE_CINEMA_LTS = 0x0007

const OPJ_PROFILE_BC_SINGLE = 0x0100

const OPJ_PROFILE_BC_MULTI = 0x0200

const OPJ_PROFILE_BC_MULTI_R = 0x0300

const OPJ_PROFILE_IMF_2K = 0x0400

const OPJ_PROFILE_IMF_4K = 0x0500

const OPJ_PROFILE_IMF_8K = 0x0600

const OPJ_PROFILE_IMF_2K_R = 0x0700

const OPJ_PROFILE_IMF_4K_R = 0x0800

const OPJ_PROFILE_IMF_8K_R = 0x0900

const OPJ_EXTENSION_NONE = 0x0000

const OPJ_EXTENSION_MCT = 0x0100

const OPJ_IMF_MAINLEVEL_MAX = 11

const OPJ_IMF_MAINLEVEL_1_MSAMPLESEC = 65

const OPJ_IMF_MAINLEVEL_2_MSAMPLESEC = 130

const OPJ_IMF_MAINLEVEL_3_MSAMPLESEC = 195

const OPJ_IMF_MAINLEVEL_4_MSAMPLESEC = 260

const OPJ_IMF_MAINLEVEL_5_MSAMPLESEC = 520

const OPJ_IMF_MAINLEVEL_6_MSAMPLESEC = 1200

const OPJ_IMF_MAINLEVEL_7_MSAMPLESEC = 2400

const OPJ_IMF_MAINLEVEL_8_MSAMPLESEC = 4800

const OPJ_IMF_MAINLEVEL_9_MSAMPLESEC = 9600

const OPJ_IMF_MAINLEVEL_10_MSAMPLESEC = 19200

const OPJ_IMF_MAINLEVEL_11_MSAMPLESEC = 38400

const OPJ_IMF_SUBLEVEL_1_MBITSSEC = 200

const OPJ_IMF_SUBLEVEL_2_MBITSSEC = 400

const OPJ_IMF_SUBLEVEL_3_MBITSSEC = 800

const OPJ_IMF_SUBLEVEL_4_MBITSSEC = 1600

const OPJ_IMF_SUBLEVEL_5_MBITSSEC = 3200

const OPJ_IMF_SUBLEVEL_6_MBITSSEC = 6400

const OPJ_IMF_SUBLEVEL_7_MBITSSEC = 12800

const OPJ_IMF_SUBLEVEL_8_MBITSSEC = 25600

const OPJ_IMF_SUBLEVEL_9_MBITSSEC = 51200

const OPJ_CINEMA_24_CS = 1302083

const OPJ_CINEMA_48_CS = 651041

const OPJ_CINEMA_24_COMP = 1041666

const OPJ_CINEMA_48_COMP = 520833

const OPJ_UINT32_SEMANTICALLY_BUT_INT32 = OPJ_INT32

const OPJ_DPARAMETERS_IGNORE_PCLR_CMAP_CDEF_FLAG = 0x0001

const OPJ_DPARAMETERS_DUMP_FLAG = 0x0002

const OPJ_STREAM_READ = OPJ_TRUE

const OPJ_STREAM_WRITE = OPJ_FALSE

const OPJ_VERSION_MAJOR = 2

const OPJ_VERSION_MINOR = 4

const OPJ_VERSION_BUILD = 0

end # module

CoreSignatureRepository instproc registerCoreGlobals {} {

    my registerVariable {} global auto_path {} list
    my registerVariable {} global env {} array
    my registerVariable {} global tcl_version {} string
    my registerVariable {} global argc {} int
    my registerVariable {} global argv {} list
    my registerVariable {} global errorCode {} string
    my registerVariable {} global errorInfo {} string
    my registerVariable {} global argv0 {} string
    my registerVariable {} global auto_index {} array
    my registerVariable {} global tcl_rcFileName {} string
    my registerVariable {} global tcl_interactive {} boolean
    my registerVariable {} global tcl_nonwordchars {} string
    my registerVariable {} global tcl_wordchars {} string
    my registerVariable {} global tcl_patchLevel {} string
    my registerVariable {} global tcl_libPath {} list
    my registerVariable {} global tcl_library {} string
    my registerVariable {} global tcl_platform {} array

    my registerVariable {} global tk_library {} string
    my registerVariable {} global tk_version {} string
    my registerVariable {} global tk_strictMotif {} boolean
    my registerVariable {} global tk_patchLevel {} string

}

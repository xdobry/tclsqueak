IDE::TclModeEdit instproc setVariableTypes varTypes {
    my instvar varArr
    unset -nocomplain varArr
    array set varArr $varTypes
}

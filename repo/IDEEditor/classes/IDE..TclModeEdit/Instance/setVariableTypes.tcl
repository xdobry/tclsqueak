IDE::TclModeEdit instproc setVariableTypes varTypes {
    my instvar varArr varTagArr
    unset -nocomplain varArr
    unset -nocomplain varTagArr
    array set varArr $varTypes
}

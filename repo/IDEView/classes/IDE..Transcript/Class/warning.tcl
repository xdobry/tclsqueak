IDE::Transcript proc warning string {
    if {[Object isobject ::transcript]} {
        ::transcript warning $string
    }
}

IDE::Transcript instproc getUIState {} {
    my instvar win
    if {$win eq ".f"} {
        return
    }
    set d [dict create create {IDE::Transcript newBrowser}]
    set fileName [my @editor getFile]
    if {$fileName ne "" && [file isfile $fileName]} {
        dict set d fileName $fileName
    }
    my addGeometryToState d $win
    return $d
}

IDE::Transcript instproc setUIState state {
    my instvar win
    if {[dict exists $state fileName]} {
        set fileName [dict get $state fileName]
        if {[file isfile $fileName] && [file readable $fileName]} {
            my @editor openFile $fileName
            my setTitleAddition $fileName
        }
    }
    my setGeometryFromState $state $win
}

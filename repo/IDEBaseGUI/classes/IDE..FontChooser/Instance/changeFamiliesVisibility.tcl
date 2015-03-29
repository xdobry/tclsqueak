IDE::FontChooser instproc changeFamiliesVisibility {} {
    my instvar onlytk
    if {$onlytk} {
        [self]::fontfamily setList [list Courier Times Helvetica]
    } else {
        [self]::fontfamily setList [font families]
    }
}

proc repobs::readFileAsComment file {
    set source ""
    set in [open $file r]
    while {[gets $in line]>=0} {
        append source {# } $line \n
    }
    close $in
    return $source
}

proc repobs::readFileAsList file {
    set l [list]
    set in [open $file r]
    while {[gets $in line]>=0} {
        lappend l $line
    }
    close $in
    return $l
}

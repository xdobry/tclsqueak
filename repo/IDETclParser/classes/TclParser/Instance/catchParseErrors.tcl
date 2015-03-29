TclParser instproc catchParseErrors eval {
    if {[TclParser isDevelMode]} {
        uplevel $eval
        return 1
    }
    set ret [catch {uplevel $eval} result options]
    if {$ret==0} {
        return 1
    } elseif {$ret==1020} {
        return 0
    } else {
        return -options $options $result
    }
}

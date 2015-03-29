PrsFileContext instproc logErrors {} {
    my instvar errors stream errorCount
    foreach err $errors {
        incr errorCount
        lassign $err begin end message
        set beginLine [my posToLine $begin]
        set endLine [my posToLine $end]
        my logMessage "$message <<[$stream copyFromTo $begin $end]>>" [lindex $beginLine 0]
    }
}

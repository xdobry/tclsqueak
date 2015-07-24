PrsFileContext instproc parseFile file {
    my instvar fileDesc lineStart linesLen isTclproc isTclGlobalScript errorCount lineCount fileName
    set errorFileStart $errorCount
    set lineCount 0
    if {![file readable $file]} {
        my logMessage "can not read $file"
        return
    }
    my openFile $file
    my logMessage "parsing file $file"

    set isTclproc 0
    set isTclGlobalScript 1

    set lineCount 1
    set completePart ""
    set lineStart $lineCount
    set linesLen [list]
    while {[gets $fileDesc line]>=0} {
        lappend linesLen [expr {[string length $line]+1}]
        append completePart $line \n
        if {[info complete $completePart]} {
            my parsePart $completePart
            set completePart ""
            incr lineCount
            set linesLen [list]
            set lineStart $lineCount
        } else {
            incr lineCount
        }
    }
    my parsePart $completePart

    my logMessage "errors file: [expr {$errorCount-$errorFileStart}]"
    close $fileDesc
    set fileName ""
}

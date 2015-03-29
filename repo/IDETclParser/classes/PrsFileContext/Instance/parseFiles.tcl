PrsFileContext instproc parseFiles files {
    my instvar errorCount repository allLinesCount
    set startTime [clock milliseconds]
    my parseFilesPass $files shallow
    my parseFilesPass $files collect
    my initPass2
    set allLinesCount 0
    [$repository getWriteRepository] resolveTypes
    my parseFilesPass $files report

    set endTime [clock milliseconds]
    set tempSec [expr {($endTime-$startTime)/1000}]

    if {$allLinesCount==0} {
        my logMessage "no lines parsed"
        return
    }
    my logMessage "errors all: $errorCount ([format %.2f [expr {100.0*$errorCount/$allLinesCount}]]% lines)"
    my logMessage "lines: $allLinesCount in: [clock format $tempSec -format "%H:%M:%S" -gmt 1] [expr {($endTime-$startTime)%1000}] lines/sec: [format %.2f [expr {(1000*$allLinesCount)/(double($endTime-$startTime))}]]"
    my logMessage [[$repository getWriteRepository] getStat]
}

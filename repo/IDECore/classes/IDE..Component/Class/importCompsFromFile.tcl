IDE::Component proc importCompsFromFile file {
    set actualDir [pwd]
    # set working dir to file dir
    set dir [file dirname $file]
    if {$dir ne ""} { cd $dir}
    my initPackageTracking
    [self]::Tracker setOn
    set res [catch {namespace eval :: source [list $file]}]
    if {$res} {
        global errorInfo
        IDE::Dialog message "Error by sourcing script from $file - $errorInfo"
        if {$dir ne ""} {cd $actualDir}
    }
    [self]::Tracker setOff
    IDE::CommentsContainer parseAndCleanMeta
    [self]::Tracker importProc
    if {$dir ne ""} {cd $actualDir}
}

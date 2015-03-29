PrsContext instproc addError {text elem} {
    #my halt
    set line [$elem prsStringToLineEnd]
    if {![regexp {#ttc noerror} $line]} {
        my lappend errors [list [$elem begin] [$elem end] $text]
    }
}

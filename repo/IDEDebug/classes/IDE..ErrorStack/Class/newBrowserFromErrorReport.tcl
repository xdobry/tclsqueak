IDE::ErrorStack proc newBrowserFromErrorReport {{file {}}} {
    if {$file eq ""} {
        set file [IDE::Dialog getOpenFile {{{xml report} *.xml}}]
    }
    if {$file eq ""} {
        return
    }
    set f [open $file r]
    set report [read $f]
    close $f
    if {[regexp {<errorStack>(.+)</errorStack>} $report _ stack]} {
        my newBrowser $stack
    }
}

POTHelper proc convertWinCvsToPo {} {
    set fileindir [IDE::Dialog getDir]
    set fileout [IDE::Dialog getSaveFile $fileindir/ms.po]
    if {$fileindir eq "" || $fileout eq ""} return
    set fo [open $fileout w]
    foreach filein [glob -directory $fileindir *.csv] {
        # if {[file tail $filein] ne "po_sch95.csv"} continue
        puts "reading $filein"
        set fi [open $filein r]
        fconfigure $fi -encoding unicode
        gets $fi
        while {[gets $fi line]>=0} {
            set line [string trim $line]
            if {$line eq ""} continue
            if {[string first Microsoft $line]>=0} continue
            if {[string first Windows $line]>=0} continue
            set arr [split $line ,]
            if {[llength $arr]<2} continue
            set from [string trim [lindex $arr 0] \"]
            set to [string trim [lindex $arr 2] \"]
            if {[string first \" $from]>=0} continue
            set from [string map {{""} {\"}} $from]
            set to [string map {{""} {\"}} $to]
            #puts "$line - $from - $to"
            if {![info complete $from]} continue
            if {[string length $from]>25} continue
            if {[info exists fromarr($from)]} continue
            set fromarr($from) 1
            puts $fo "msgid \"$from\""
            puts $fo "msgstr \"$to\""
            puts $fo ""
        }
        close $fi
    }
    close $fo
}

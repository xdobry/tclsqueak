POTHelper proc convertWinToPo {} {
    set filein [IDE::Dialog getOpenFile]
    set fileout [IDE::Dialog getSaveFile $filein.po]
    if {$filein eq "" || $fileout eq ""} return
    set fi [open $filein r]
    set fo [open $fileout w]
    while {[gets $fi line]>=0} {
        set line [string trim $line]
        if {$line eq ""} continue
        set i [string first = $line]
        if {$i<0} continue
        puts $fo "msgid \"[string range $line [expr {$i+1}] end]\""
        puts $fo msgstr
    }
    close $fi
    close $fo
}

POTHelper instproc convertXLIFFtoMsg {} {
    package require tdom
    set file [::IDE::Dialog getOpenFile]
    if {$file eq ""} return
    set f [open $file r]

    set lan [IDE::IDialogEntry getValue "target language"]

    set ofile [IDE::Dialog getSaveFile [file join [file dirname $file] $lan.msg]]
    if {$ofile eq ""} return
    set of [open $ofile w]
    fconfigure $of -encoding utf-8


    package require tdom
    fconfigure $f -encoding utf-8
    set document [dom parse [read $f]]
    close $f
    foreach tu [[$document documentElement] selectNodes file/body/trans-unit] {
        set source [lindex [$tu selectNodes source] 0]
        set target [lindex [$tu selectNodes target] 0]
        if {$target eq ""} {
            continue
        }
        set source [my nodeTextDeep $source]
        set source [string map [list \n \\n] [my maskUTF8 $source]]
        set target [my nodeTextDeep $target]
        set target [string map [list \n \\n] [my maskUTF8 $target]]
        puts $of "::msgcat::mcset $lan \"$source\" \"$target\""
    }
    close $of

    $document delete
}

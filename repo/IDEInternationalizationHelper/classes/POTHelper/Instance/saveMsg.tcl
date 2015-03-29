POTHelper instproc saveMsg {{fileName {}}} {
    if {$fileName eq ""} {
         set types {{"MSG catalog" .msg}}
         set fileName [IDE::Dialog getSaveFile {} $types .msg]
    }
    if {$fileName eq ""} return
    set lan [IDE::IDialogEntry getValue "target language"]

    my instvar catalog
    set f [open $fileName w]
    puts $f "# Message Catalog File generated by XOTclIDE Internationalization Helper PlugIn"
    foreach str $catalog {
        set translation [msgcat::mc $str]
        if {$str ne $translation} {
            puts $f "::msgcat::mcset $lan \"$str\" \"[my maskString $translation]\""
        } else {
            puts $f "#::msgcat::mcset $lan \"$str\" \"###\""
        }
    }
    close $f
}
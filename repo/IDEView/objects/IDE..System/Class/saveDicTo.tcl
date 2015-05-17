IDE::System proc saveDicTo {dic file} {
    set out [open [file join $file] w]
    dict for {key value} $dic {
        puts $out [list $key $value]
    }
    close $out
}

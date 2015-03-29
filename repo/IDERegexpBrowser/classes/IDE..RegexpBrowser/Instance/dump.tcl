IDE::RegexpBrowser instproc dump {} {
    my instvar data

    # update display
    my go
    # built list of options
    set dump "regexp"
    foreach option {nocase all line lineanchor linestop inline} {
        if {[my set v:$option] ne ""} {
            append dump " [my set v:$option]"
        }
    }
    # build expression
    set exp [$data(w:regexp) get 1.0 end-1char]
    append dump " -- {$exp} string"
    # add variables if needed
    if {[my set v:inline] eq ""} {
        append dump " match"
        for {set i 1} {$i < $data(v:nblevels)} {incr i} {
            append dump " v$i"
        }
    }
    # put dump into the clipboard (by creating a hidden entry ... anyone has a better solution?)
    set tw .e
    destroy $tw
    entry $tw
    $tw insert 0 $dump
    $tw selection range 0 end
}

IDE::Editor instproc saveFile fname {
    set fh [open $fname w]
    puts -nonewline $fh [my getText]
    close $fh
}

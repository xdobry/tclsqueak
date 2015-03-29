IDE::InputCache proc saveCache file {
    my instvar cacheArr
    set out [open $file w]
    puts $out "# xotclide cache file for input fields"
    foreach {k v} [array get cacheArr] {
        puts $out [list $k $v]
    }
    close $out
}

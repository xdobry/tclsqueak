TclParser instproc skipSeparators {} {
    my instvar stream
    set char [$stream getChar]
    while {![$stream atEnd] && [string first $char "\t \\"]!=-1} {
        if {$char eq "\\"} {
            if {[$stream atEnd]} {
                return
            }
            $stream addPos 1
            set char [$stream getChar]
            if {$char ne "\n"} {
                 $stream addPos -1
                 return
            }
        }
        $stream addPos 1
        set char [$stream getChar]
    }
}

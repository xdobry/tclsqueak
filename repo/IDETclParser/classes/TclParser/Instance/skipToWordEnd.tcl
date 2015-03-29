TclParser instproc skipToWordEnd {} {
    my instvar stream
    set char [$stream getChar]
    while {![$stream atEnd] && ([string is wordchar $char] || $char eq ":")} {
        # we need at least "::"
        if {$char eq ":"} {
            if {[$stream atEnd]} {
                return
            }
            $stream addPos 1
            set char [$stream getChar]
            if {$char ne ":"} {
                 $stream addPos -1
                 return
            } else {
                # skip all following collons
                set char [$stream getChar]
                while {![$stream atEnd] && $char eq ":"} {
                    $stream addPos 1
                    set char [$stream getChar]
                }
                continue
            }
        }
        $stream addPos 1
        set char [$stream getChar]
    }
}

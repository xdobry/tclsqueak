PrsContext instproc check_return {count command notifier} {
    # ignore switches / options

    for {set x 1} {$x<=$count} {incr x 2} {
        set elem [$command getElem $x]
        if {![$elem hasclass PrsLiteral] || [string index [$elem prsString] 0] ne "-"} {
            break
        }
    }
    if {$x<=$count} {
        set type [my getTypeFromElem [$command getElem $x]]
    } else {
        set type void
    }
    $command setType $type
    my addReturnType $type
}

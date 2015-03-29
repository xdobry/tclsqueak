POTHelper instproc maskUTF8 text {
    set out ""
    for {set x 0} {$x<[string length $text]} {incr x} {
        set c [string index $text $x]
        set i [scan $c %c]
        if {$i>127} {
            append out "\\u[format %04x $i]"
        } else {
            append out $c
        }
    }
    return $out
}

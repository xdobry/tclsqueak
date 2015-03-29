IDE::ProgEdit instproc getIdent {} {
    set twin [my getTextWindow]
    set lineStart [$twin index "insert -1 l linestart"]
    set line [$twin get $lineStart [$twin index "$lineStart lineend"]]
    set length [string length $line]
    for {set i 0} {[string is space [string index $line $i]] && $i<$length} {incr i} {}
    if {[string index $line end] eq "\{"} {
        incr i 4
        set i [expr {-$i}]
    }
    return $i
}

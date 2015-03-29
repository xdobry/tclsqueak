TclParser instproc getBeginingVariable {parent {isArrayKey 0}} {
    my instvar stream
    set pbegin [$stream pos]
    set variable [my getVariable $parent]
    if {$variable eq ""} {
        return
    }
    set char [$stream getChar]
    if {[my isEndList]} {
        return $variable
    } else {
        # ther are another characters after variable parse it as char sequence
        # $a.ew $a[set b] $a(e)ewr
        $variable destroy
        $stream pos $pbegin
        if {$isArrayKey} {
            return [my getCharKeySequence $parent]
        } else {
            return [my getCharSequence $parent]
        }
    }
}

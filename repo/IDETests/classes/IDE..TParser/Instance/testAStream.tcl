IDE::TParser instproc testAStream {} {
    set sample {abcdeftghijk}
    set obj [ReadStringStream new -volatile -string $sample]
    my assert {![$obj atEnd]}
    my assert {[$obj getChar] eq "a"}
    my assert {[$obj pos]==0}
    my assert {[$obj nextChar] eq "a"}
    my assert {[$obj getChar] eq "b"}
    my assert {[$obj pos]==1}
    $obj addPos 2
    my assert {[$obj getChar] eq "d"}
    $obj addPos -2
    my assert {[$obj getChar] eq "b"}
    my assert {[$obj pos]==1}
    my assert {![$obj atEnd]}
    $obj pos 0
    set x 0
    while {![$obj atEnd]} {
        my assert {[$obj nextChar]==[string index $sample $x]}
        incr x
        my assert {[$obj pos]==$x}
    }
    my assert {[string length $sample]==$x}
    my assert {[$obj copyFromTo 0 1] eq "ab"}
}

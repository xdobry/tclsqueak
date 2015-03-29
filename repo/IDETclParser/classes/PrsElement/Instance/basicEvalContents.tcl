PrsElement instproc basicEvalContents {} {
    my set operation eval
    set parser [my getParser]
    set stream [$parser stream]
    set opos [$stream pos]
    set olastpos [$stream lastpos]
    set offset [my getContentOffset]
    $stream pos [expr {[my begin]+$offset}]
    $stream lastpos [expr {[my end]-$offset}]
    $parser parseScriptTo [self]
    $stream pos $opos
    $stream lastpos $olastpos
}

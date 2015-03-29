PrsElement instproc basicParseAsVariableRef {} {
    my set operation eval
    set parser [my getParser]
    set stream [$parser stream]
    set opos [$stream pos]
    set olastpos [$stream lastpos]
    $stream pos [my begin]
    $stream lastpos [my end]
    $parser parseVariableRef [self]
    $stream pos $opos
    $stream lastpos $olastpos
    my class PrsVariableRef
}

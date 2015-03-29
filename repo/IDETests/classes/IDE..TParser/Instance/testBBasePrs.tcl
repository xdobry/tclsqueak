IDE::TParser instproc testBBasePrs {} {
    set sample { abc "efg" [hij] {klm} }
    set stream [ReadStringStream new -childof [self] -string $sample]
    set prs [TclParser new -childof [self] -stream $stream]
    my assert {[$stream getChar] eq " "}
    $prs skipBlanks
    my assert {[$stream getChar] eq "a"}
    $prs skipToWordEnd
    my assert {[$stream getChar] eq " "}
    $prs skipCharacters "\t "
    my assert {[$stream getChar] eq "\""}
    $prs destroy
    $stream destroy
}

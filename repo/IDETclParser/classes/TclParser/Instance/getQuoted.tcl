TclParser instproc getQuoted parent {
    my instvar stream
    set quote [PrsQuoted new -childof $parent -begin [$stream pos] -hasQuote 1]
    $stream addPos 1
    my parseQuote
    $quote end [$stream pos]
    $stream addPos 1
    $quote substituteContents
    return $quote
}

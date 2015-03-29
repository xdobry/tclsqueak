TclParser instproc getBeginingCommandSubstPure parent {
    my instvar stream
    set begin [$stream pos]
    my parseCommandSubst
    set end [$stream pos]
    $stream addPos 1
    set char [$stream getChar]
    set commandsubst [PrsCommandSubst new -childof $parent -begin $begin -end $end]
    $commandsubst evalContents
    return $commandsubst
}

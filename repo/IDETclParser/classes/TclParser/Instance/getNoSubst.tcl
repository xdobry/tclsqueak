TclParser instproc getNoSubst parent {
    my instvar stream
    set commandsubst [PrsNoSubst new -childof $parent -begin [$stream pos]]
    my parseNoSubst
    $commandsubst end [$stream pos]
    $stream addPos 1
    return $commandsubst
}

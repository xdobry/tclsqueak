TclParser instproc getCommandSubst parent {
    my instvar stream
    set commandsubst [PrsCommandSubst new -childof $parent -begin [$stream pos]]
    my parseCommandSubst
    $commandsubst end [$stream pos]
    $stream addPos 1
    $commandsubst evalContents
    return $commandsubst
}

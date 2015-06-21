PrsArgumentExpansion instproc substituteContents {} {
    my instvar list
    my halt
    foreach elem $list {
        $elem substituteContents
    }
}

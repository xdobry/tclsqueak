PrsArgumentExpansion instproc substituteContents {} {
    my instvar list
    foreach elem $list {
        $elem substituteContents
    }
}

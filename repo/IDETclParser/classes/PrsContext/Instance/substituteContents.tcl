PrsContext instproc substituteContents elem {
    $elem substituteContents
    $elem visit [self]
}

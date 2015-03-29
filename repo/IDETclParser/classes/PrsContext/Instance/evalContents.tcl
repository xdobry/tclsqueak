PrsContext instproc evalContents elem {
    $elem evalContents
    $elem visit [self]
}

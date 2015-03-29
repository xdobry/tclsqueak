proc repobs::getFilePath path {
    set fpath [list]
    foreach p $path {
        lappend fpath [asFileName $p]
    }
    return $fpath
}

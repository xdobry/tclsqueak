PrsFileContext instproc parsePartGlobal script {
    #puts $script
    my parseGlobal $script
    my logErrors
    lsearch -all -asc -exact {1 2 3} ew
}

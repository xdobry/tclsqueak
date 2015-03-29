PrsFileContext instproc initPass2 {} {
    my instvar errorCount repository
    $repository initNewCreateMethods
    set errorCount 0
}

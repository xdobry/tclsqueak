PrsFileContext proc startFromShell args {
    set fileContext [PrsFileContext new]
    $fileContext startWithArgs $args
}

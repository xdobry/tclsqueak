PrsFileContext proc startFromShell arguments {
    set fileContext [PrsFileContext new]
    $fileContext startWithArgs $arguments
}

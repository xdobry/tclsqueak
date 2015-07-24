PrsFileContext proc startFromShell argv {
    set fileContext [PrsFileContext new]
    $fileContext startWithArgs $argv
}

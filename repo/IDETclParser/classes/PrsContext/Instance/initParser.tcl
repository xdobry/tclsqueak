PrsContext instproc initParser script {
    my instvar parser stream errors varArr
    set errors [list]
    unset -nocomplain varArr
    $parser cleanUp
    $stream setString $script
}

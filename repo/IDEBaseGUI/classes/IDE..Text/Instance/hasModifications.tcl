IDE::Text instproc hasModifications {} {
    my instvar win
    $win.text edit modified
}

PrsContext instproc check_while {count command notifier} {
    my substituteContents [$command getElem 1]
    my evalContents [$command getElem 2]
}

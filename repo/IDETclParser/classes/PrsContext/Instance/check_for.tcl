PrsContext instproc check_for {count command notifier} {
    my evalContents [$command getElem 1]
    my substituteContents [$command getElem 2]
    my evalContents [$command getElem 3]
    my evalContents [$command getElem 4]
}

PrsContext instproc check_lset {count command notifier} {
    my checkVariableFrom [$command getElem 1] $notifier
}

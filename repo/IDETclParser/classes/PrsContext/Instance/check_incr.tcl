PrsContext instproc check_incr {count command notifier} {
    my checkVariableFrom [$command getElem 1] $notifier
}

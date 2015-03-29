PrsContext instproc check_append {count command notifier} {
    my addVariableFrom [$command getElem 1] $notifier [list string]
}

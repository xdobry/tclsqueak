PrsContext instproc check_expect_background {count command notifier} {
    # it is expect from expect tcl based application
    my check_expect_before $count $command $notifier
}

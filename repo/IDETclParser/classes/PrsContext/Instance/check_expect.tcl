PrsContext instproc check_expect {count command notifier} {
    # it is expect from expect tcl based application
    set options {-re -ex -nocase -indices -notransfer -not}
    set aoptions {-timeout -i}
    my addVariable expect_out $command $notifier array
    my addVariable spawn_out $command $notifier array
    my checkExpectCmd $count $command $notifier $options $aoptions 1
}

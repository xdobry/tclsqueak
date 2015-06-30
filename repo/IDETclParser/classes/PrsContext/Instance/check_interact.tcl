PrsContext instproc check_interact {count command notifier} {
    # it is expect from expect tcl based application
    set options {-re -ex -nocase -indices -notransfer -not -reset -echo -iwrite -nobuffer -o}
    set aoptions {-timeout -i -u -input -output}
    my checkExpectCmd $count $command $notifier $options $aoptions 0
}

PrsContext instproc xocheck_proc {count type object command notifier} {
    my instvar namespace
    my subParse $command $notifier $namespace
}

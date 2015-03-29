PrsContext instproc xocheck_instproc {count type object command notifier} {
    my instvar namespace
    my subParse $command $notifier $namespace
}

PrsContext instproc checkTclCommand {name command notifier} {
    my instvar repository namespace
    set desc [$repository getCommandDescription $name $namespace]
    if {$desc eq ""} {
        $notifier addError "unknown proc '$name'" [$command getElem 0]
        return 0
    }
    set fullName [lindex $desc 0]
    set count [$command argsCount]
    [$command getElem 0] set ref [list proc $fullName]
    if {![my checkParametersToDesc $command $notifier 1 $desc]} {
        return 0
    }

    set checkCmdName check_[regsub :: [string trimleft $fullName :] _]
    if {[my info methods $checkCmdName] ne ""} {
        tlog::info "checking special command $fullName"
        my $checkCmdName $count $command $notifier
    }
    return 1
    if {0} {
        my check_xotcl_self $count $command $notifier
        my check_gets $count $command $notifier
        my check_proc $count $command $notifier
        my check_while $count $command $notifier
        my check_package $count $command $notifier
        my check_upvar $count $command $notifier
        my check_unset $count $command $notifier
        my check_return $count $command $notifier
        my check_foreach $count $command $notifier
        my check_global $count $command $notifier
        my check_switch $count $command $notifier
        my check_dict $count $command $notifier
        my check_namespace $count $command $notifier
        my check_itcl_local $count $command $notifier
        my check_variable $count $command $notifier
        my check_append $count $command $notifier
        my check_lset $count $command $notifier
        my check_itcl_body $count $command $notifier
        my check_for $count $command $notifier
        my check_expr $count $command $notifier
        my check_catch $count $command $notifier
        my check_set $count $command $notifier
        my check_incr $count $command $notifier
        my check_lassign $count $command $notifier
        my check_itcl_class $count $command $notifier
        my check_regexp $count $command $notifier
        my check_lappend $count $command $notifier
        my check_try $count $command $notifier
        my check_if $count $command $notifier
    }
}

PrsContext instproc checkDirectObjectCall {cobject command notifier} {
    my instvar repository namespace

    [$command getElem 0] set ref [list object $cobject]
    if {[$command argsCount]==0} {
        $command setType [concat obj $cobject]
        return
    }
    set method [$command getElem 1]
    if {![$method hasclass ::PrsLiteral]} return
    set mname [$method prsString]

    set desc [$repository getMethodDescriptionForObject $cobject $mname]

    if {$desc eq ""} {
        if {([$repository isXotclMetaClass $cobject] || [$repository isXotclClass $cobject]) && ([$repository objectHasClass $cobject $namespace Class] || [$repository objectHasClass $cobject $namespace ::itcl::class])} {
             #puts "create direct $cobject"
             set desc [$repository getMethodDescriptionForObject $cobject create]
             my checkParametersToDesc $command $notifier 1 $desc
             my xocheck_create [$command argsCount] proc $cobject $command $notifier 1
        } else {
            $notifier addError "method '$mname' unknown" $method
        }
    } else {
        $method set ref [list method [lindex $desc 0]]
        my checkParametersToDesc $command $notifier 2 $desc
        # the type signature for new will be already adapted in signature repository
        if {[lindex $desc 0 0] eq "::oo::class" && [my info methods oocheck_$mname] ne ""} {
            my oocheck_$mname [$command argsCount] proc $cobject $command $notifier
        } elseif {[my info methods xocheck_$mname] ne ""} {
            my xocheck_$mname [$command argsCount] proc $cobject $command $notifier
        }
    }
}

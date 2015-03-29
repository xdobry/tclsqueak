PrsContext instproc checkObjectSelfCall {command notifier} {
    my instvar object isInstproc isTclproc isTclGlobalScript

    if {$isTclproc || $isTclGlobalScript} {
        my addError "xotcl::self can be used only in xotcl object context" $command
        return
    }

    if {[$command argsCount]==0} {
        #puts "self call [$command printString]"
        $command setType [concat xotcl $object]
        return
    }
    set method [lindex [$command list] 1]
    if {[$method info class] ne "::PrsLiteral"} return
    set mname [$method prsString]

    # ignore names in muster @name that as subobject call
    if {[string index $mname 0] eq "@"} {
        return
    }
    if {$isInstproc} {
        my checkObjectClassCall $object $command $notifier
    } else {
        my checkDirectObjectCall $object $command $notifier
    }
}

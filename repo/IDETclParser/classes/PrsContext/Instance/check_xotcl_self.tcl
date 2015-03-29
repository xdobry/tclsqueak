PrsContext instproc check_xotcl_self {count command notifier} {
    my instvar object isInstproc isTclproc isTclGlobalScript
    if {$isTclproc || $isTclGlobalScript} {
        # error will be producted in checkObjectSelfCall
        # my addError "xotcl::self can be used only in xotcl object context" $command
        return
    }
    if {!$isTclproc} {
        if {$count>0} {
            if {[[$command getElem 1] isLiteral class]} {
                $command setType [concat obj $object]
            }
        } else {
            $command setType [concat xotcl $object]
        }
    }
}

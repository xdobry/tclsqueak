PrsContext instproc check_oo_objdefine {count command notifier} {
    my instvar repository namespace parser parseMode
    if {$count>=2} {
        set nameElem [$command getElem 1]
        set argumentsElem [$command getElem 2]
        set bodyElem [$command getElem 3]
        if {[$nameElem hasclass PrsLiteral]} {
            set objName [$nameElem prsString]
            if {![my objectHasClass $objName ::oo::object]} {
                $notifier addError "is not TclOO object $objName" $nameElem
                return
            }
            set context [PrsOOTclContext new -childof [self] -namespace $namespace -repository $repository -parser $parser]
            $context set namespace $namespace
            $context set name $objName
            $context set parseMode $parseMode
            $context parse_define_method $command $notifier 0
            my importErrors $context 0
            # [$command set begin]
            $context destroy
        }
    }
}

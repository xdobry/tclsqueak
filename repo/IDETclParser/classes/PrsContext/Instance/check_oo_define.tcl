PrsContext instproc check_oo_define {count command notifier} {
    my instvar repository namespace parser parseMode
    if {$count>=2} {
        set nameElem [$command getElem 1]
        if {[$nameElem hasclass PrsLiteral]} {
            set className [$nameElem prsString]
            if {"::oo::object" ni [$repository getFullHeritage $className $namespace]} {
                $notifier addError "is not TclOO class $className" $nameElem
                return
            }
            set context [PrsOOTclContext new -childof [self] -namespace $namespace -repository $repository -parser $parser]
            $context set namespace $namespace
            $context set name $className
            $context set parseMode $parseMode
            $context parse_define_method $command $notifier
            my importErrors $context 0
            # [$command set begin]
            $context destroy
        }
    }
}

PrsContext instproc check_itcl_body {count command notifier} {
    my instvar repository namespace parser parseMode
    if {$count==3} {
        set nameElem [$command getElem 1]
        set argumentsElem [$command getElem 2]
        set bodyElem [$command getElem 3]
        if {[$nameElem hasclass PrsLiteral]} {
            set name [$nameElem prsString]
            set functionName [namespace tail $name]
            if {$functionName eq ""} {
                $notifier addError "can not extract function name (expect class::function)" $nameElem
                return
            }
            set className [namespace qualifiers $name]
            if {"::itcl::object" ni [$repository getFullHeritage $className $namespace]} {
                $notifier addError "is not itcl class $className" $nameElem
                return
            }
            set context [PrsITclContext new -childof [self] -namespace $namespace -repository $repository -parser $parser]
            $context set namespace $namespace
            $context set name $className
            $context set parseMode $parseMode
            $context parse_body_method $functionName $command $notifier
            my importErrors $context 0
            # [$command set begin]
            $context destroy
        }
    }
}

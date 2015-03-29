PrsContext instproc parseShallow {} {
    my instvar object isTclproc isInstproc errors name repository namespace rootCommand parser hasNonPosArgs returnTypes forceRetType

    set count [$rootCommand getListLength]
    set objectElem [$rootCommand getElem 0]
    if {![$objectElem hasclass PrsLiteral]} {
        my addError "First elem in list need to be literal" $objectElem
        return 0
    }
    set object [$objectElem prsString]

    set hasNonPosArgs 0
    set returnTypes [list]
    unset -nocomplain forceRetTypes

    if {$object eq "proc"} {
        set isTclproc 1
        set isInstproc 0
        set shift 1
    } elseif {$object eq "oo::define"} {
        set argCount [$rootCommand argsCount]
        $parser root [$rootCommand getElem $argCount]
        my check_oo_define $argCount $rootCommand [self]
        return 0
    } elseif {$object eq "oo::objdefine"} {
        set argCount [$rootCommand argsCount]
        $parser root [$rootCommand getElem $argCount]
        my check_oo_objdefine $argCount $rootCommand [self]
        return 0
    } else {
        set isTclproc 0
        if {![$repository isXotclObject $object $namespace]} {
            my addError "Await xotcl object but got $object" $objectElem
            return 0
        }
        set object [$repository getFullObjectName $object $namespace]
        set methodtypeElem [$rootCommand getElem 1]
        if {![$methodtypeElem hasclass PrsLiteral]} {
            my addError "Expect proc or instproc" $methodtypeElem
            return 0
        }
        set methodtype [$methodtypeElem prsString]
        if {$methodtype eq "instproc"} {
            set isInstproc 1
        } elseif {$methodtype eq "proc"} {
            set isInstproc 0
        } else {
            my addError "Expect proc or instproc" $methodtypeElem
            return 0
        }
        set shift 2
    }
    set nameElem [$rootCommand getElem $shift]
    if {![$nameElem hasclass PrsLiteral]} {
        if {[$nameElem hasclass PrsNoSubst]} {
            set name [$nameElem prsContentString]
        } else {
            my addError "Expect name of proc/method as literal" $nameElem
            return 0
        }
    } else {
        set name [$nameElem prsString]
    }
    set pnamespace [namespace qualifiers $name]
    if {$pnamespace ne ""} {
        set namespace [my joinNamespace $pnamespace]
        set name [namespace tail $name]
    }
    incr shift
    my initVariablesFromArguments
    if {$isTclproc} {
        tlog::ldebug {parse proc definition $name}
    } else {
        tlog::ldebug {parse method definition $object>$name (instproc $isInstproc)}
    }
    return 1
}

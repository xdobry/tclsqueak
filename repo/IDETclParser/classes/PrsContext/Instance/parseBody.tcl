PrsContext instproc parseBody {} {
    # !!! no base list consistency check
    my instvar hasNonPosArgs parser rootCommand isTclproc parseMode
    set i 2
    if {!$isTclproc} {
        incr i
        if {$hasNonPosArgs} {
            incr i
        }
        incr i
    } else {
        incr i
    }
    set root [$rootCommand getElem $i]
    if {$root eq ""} {
        my addError "method/proc body not found" $rootCommand
        return 0
    }
    $parser root $root
    if {$parseMode ne "shallow"} {
        $root evalContents
    }
    return 1
}

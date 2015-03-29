IDE::Component instproc addRequiredCompList comps {
    my instvar requiredComp
    foreach comp $comps {
        if {$comp ni $requiredComp} {
            set compObj [IDE::Component getCompObjectForNameIfExist $comp]
            if {$compObj eq ""} {

            } else {
                if {[my getName] in [$compObj getRequiredFromDeep]} {
                    IDE::Dialog error "Refuse to add requirment \"$comp\" to component \"[my getName]\" in reason of circular requirements. Please check class inhariance. This one could not be loaded later"
                } else {
                    ide::lappendIfNone requiredComp $comp
                }
            }
        }
    }
}

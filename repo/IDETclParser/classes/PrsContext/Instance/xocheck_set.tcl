PrsContext instproc xocheck_set {count type object command notifier} {
    my instvar repository
    if {$count==3} {
        set vtype [[$command getElem 3] getType]
        my addVariableFrom [$command getElem 2] $notifier $vtype [list $type $object]
        $command setType $vtype
    } elseif {$count==2} {
        set typeElem [$command getElem 2]
        if {[$typeElem hasclass PrsLiteral]} {
            set varName [$typeElem prsString]
            set vtype [$repository getVariableType $object $type $varName]
            if {$vtype ne ""} {
                $command setType $vtype
            }
        }
    }
}

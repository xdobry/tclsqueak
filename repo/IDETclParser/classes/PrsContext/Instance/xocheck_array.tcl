PrsContext instproc xocheck_array {count type object command notifier} {
    my instvar repository
    if {$count==4 && [[$command getElem 2] isLiteral set]} {
        my addVariableFrom [$command getElem 3] $notifier array [list $type $object]
    } elseif {$count==3 && [[$command getElem 2] isLiteral get]} {

    }
}

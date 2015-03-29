PrsContext instproc addVariableFrom {prsObject notifier {type unknown} {scope {}} {overridetype 0}} {
    my instvar varTypes
    if {$scope eq ""} {
        set scope [my getDefaultScope]
    }
    $prsObject parseAsVariableRef
    if {[$prsObject hasclass PrsVariableRef]} {
        set name [$prsObject getVariableName]
        if {[$prsObject isArray]} {
            set type [list array $type]
        }
        my addVariable $name $prsObject $notifier $type $scope $overridetype
    } elseif {[$prsObject hasclass PrsVariable]} {
        if {[my checkVariable [$prsObject getVariableName]] && ![my exists varrefref] && ![PrsCheckerOptions allowVarRef]} {
            $notifier addError "usually expect here variable name and not its value (remove \$)" $prsObject
        }
    }
}

PrsContext instproc addVariable {name prsObject notifier {type unknown} {scope local} {overridetype 0}} {
    #ttc vartype type list
    my instvar varArr repository namespace
    if {[string first :: $name]>=0} {
        set scope [list global]
    }
    set type0 [lindex $type 0]
    tlog::ltrace {addVariable $name $type $scope $overridetype}
    if {![info exists varArr($name)]} {
         if {[lindex $scope 0] in {instproc proc global}} {
            set regType ""
             if {$type0 in {def unknown}} {
                 set regType [$repository getVariableType [lindex $scope 1] [lindex $scope 0] $name $namespace]
                 if {$regType ne ""} {
                     set type $regType
                 }
             }
             if {$type0 eq ""} {
                 set type unknown
             }
             if {$regType eq "" || $overridetype} {
                 # do not pass override for global variables
                 $repository registerVariable [lindex $scope 1] [lindex $scope 0] $name $namespace $type 0
             }
         }
         set varArr($name) [list $type $scope]
    } else {
         lassign $varArr($name) currType currScope
         #ttc vartype type list
         if {[my updateComplexType $name $currType $type $currScope]} {
             return
         }
         set currType0 [lindex $currType 0]
         if {$currType0 in {unknown def string} || ([PrsCheckerOptions allowSetTypeChange] && $overridetype)} {
             set varArr($name) [list $type $currScope]
         } elseif {$currType0 eq "array" && $type0 ni {array def}} {
             if {$notifier ne ""} {
                 $notifier addError "can not use array as scalar" $prsObject
             }
         } elseif {$currType0 ne "array" && $type0 eq "array"} {
             if {$notifier ne ""} {
                 $notifier addError "can not use scalar as array" $prsObject
             }
         }

         if {[lindex $currScope 0] in {instproc proc global} && $overridetype} {
             if {$type0 eq "unknown"} {
                 set overridetype 0
             }
             $repository registerVariable [lindex $currScope 1] [lindex $currScope 0] $name $namespace $type $overridetype
         }
    }
}

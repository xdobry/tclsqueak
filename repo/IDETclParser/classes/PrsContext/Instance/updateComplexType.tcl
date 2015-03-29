PrsContext instproc updateComplexType {varName currentType requiredType scope} {
    my instvar varArr repository namespace

    # complex types are list and array
    # they can be types as "list int" or "array int" but if there will be "list string" the type
    # will be changed to "list unknown" so it means the list contains different types

    if {[lindex $currentType 0] in {array list} && [lindex $currentType 0] eq [lindex $requiredType 0]
         && [lindex $currentType 1] ne "unknown" && [llength $requiredType]>1
         && [lindex $currentType 1] ne [lindex $requiredType 1]} {
        if {[lindex $currentType 1] ne "" && [lindex $currentType 1] ne [lindex $requiredType 1]} {
            set desc [list [list [lindex $currentType 0] unknown] $scope]
        } else {
            set desc [list $requiredType $scope]
        }
        set varArr($varName) $desc
        if {[lindex $scope 0] in {global proc instproc}} {
            $repository registerVariable [lindex $scope 1] [lindex $scope 0] $varName $namespace [lindex $desc 0]
        }
        tlog::ltrace {updating complex variable type $varName type=$requiredType}
        return 1
    }
    return 0
}

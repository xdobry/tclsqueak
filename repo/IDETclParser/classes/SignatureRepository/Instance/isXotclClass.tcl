SignatureRepository instproc isXotclClass {name {namespace {}}} {
    my instvar xotclObjectsArr
    set fullName [my getFullObjectName $name $namespace]
    if {$fullName eq ""} {
        return 0
    }
    if {![catch {set xotclObjectsArr($fullName)} desc]} {
        return [expr {[lindex $desc 0] in {Class ::xotcl::Class ::itcl::class ::oo::class}}]
    } else {
        return 0
    }
}

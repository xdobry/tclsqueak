CoreSignatureRepository instproc getCommandDescriptionBase {name {namespace {}}} {
    my instvar commandsArr
    set fullName [my getFullName $namespace $name]
    if {![catch {set commandsArr($fullName)} desc]} {
        return [linsert $desc 0 $fullName]
    }
    return
}

SignatureRepository instproc safeRepository file {
    my instvar commandsArr variableArr methodsArr xotclObjectsArr namespaceExport namespaceImport
    set out [open $file w]
    foreach c [lsort [array names commandsArr]] {
        puts $out "registerProc [list $c] [list $commandsArr($c)]"
    }
    foreach c [lsort [array names variableArr]] {
        set desc $variableArr($c)
        lassign $c class type name
        puts $out "registerVariable [list $class $type $name {} $desc]"
    }
    foreach c [lsort [array names methodsArr]] {
        set desc $methodsArr($c)
        lassign $c class type name
        puts $out "registerMethod [list $class $type $name $desc {}]"
    }
    foreach obj [lsort [array names xotclObjectsArr]] {
        set desc $xotclObjectsArr($obj)
        puts $out "registerObject [list $obj] [concat $desc]"
    }
    foreach ns [lsort [array names namespaceExport]] {
        puts $out "addNamespaceExport [list $ns] [list $namespaceExport($ns)]"
    }
    foreach ns [lsort [array names namespaceImport]] {
        set imports $namespaceImport($ns)
        if {[llength $imports]>0} {
            puts $out "addNamespaceImport [list $ns] [list $namespaceImport($ns)]"
        }
    }
    close $out
}

PrsOOTclContext instproc xocheck_create {count type lobject command notifier {startParam 2}} {
    my instvar repository namespace object
    set fullClass [$repository getFullObjectName $lobject $namespace]
    if {"::oo::object" ni [$repository getFullHeritage $fullClass] || [$repository isXotclMetaClass $fullClass] || ![$repository isXotclClass $fullClass]} {
        next
    } else {
        set nameElem [$command getElem $startParam]
        if {$nameElem ne "" && [$nameElem hasclass PrsLiteral]} {
            set name [$nameElem prsString]
            if {[my exists object]} {
                $repository registerVariable [my set object] subobject $name {} $fullClass
            }
        }
    }
}

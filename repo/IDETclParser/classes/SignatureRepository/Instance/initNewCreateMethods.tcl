SignatureRepository instproc initNewCreateMethods {} {
    my instvar methodsArr xotclObjectsArr
    foreach obj [array names xotclObjectsArr] {
        if {[my isXotclClass $obj] && "::xotcl::Object" in [my getFullHeritage $obj]} {
            set fnameCreate [list $obj proc create]
            set descCreate [my getMethodDescription $fnameCreate]
            set fnameNew [list $obj proc new]
            set descNew [my getMethodDescription $fnameNew]
            if {$descCreate eq "" || $descNew eq ""} {
                my initNewCreateMethodsForClass $obj
            }
        }
    }

}

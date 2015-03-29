SignatureRepository instproc getMethodDescription fname {
    my instvar methodsArr
    if {[catch {set methodsArr($fname)} desc]} {
        return
    } else {
        return [linsert $desc 0 $fname]
    }
}

IDE::ProcsGroupPer instproc setDefBody skript {
    next
    if {[my exists objectid]} {
        my updateAttributes defbody
    }
}

PrsMarkupVisitor instproc methodDefToHuman def {
    switch -exact -- [lindex $def 0] {
        method {
            lassign [lindex $def 1] class type method
            if {$type ne "instproc"} {
                return "$class $type>$method"
            } else {
                return "$class>$method"
            }
        }
        proc {
            return [lindex $def 1]
        }
        default {
            return $def
        }
    }
}

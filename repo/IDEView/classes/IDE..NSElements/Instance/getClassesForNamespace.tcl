IDE::NSElements instproc getClassesForNamespace {inspectObject namespace} {
    set lambda {
        p  {
            set classes {}
            foreach ns [namespace children [namespace current]] {
                if {[::xotcl::Object isclass $ns]} {
                    lappend classes $ns
                }
            }
            return $classes
        }
    }
    lappend lambda $namespace
    $inspectObject inspectEvalNs $namespace [list apply $lambda 0]
}

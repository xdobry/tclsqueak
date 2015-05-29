IntroSignatureRepository instproc isXotclObject {name {namespace {}}} {
    if {$namespace eq "" || ![namespace exists $namespace]} {
        Object isobject $name
    } else {
        expr {[Object isobject $name] || [namespace eval $namespace [list ::xotcl::Object isobject $name]]}
    }
}

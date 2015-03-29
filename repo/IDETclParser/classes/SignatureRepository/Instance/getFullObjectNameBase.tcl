SignatureRepository instproc getFullObjectNameBase {object {namespace {}}} {
    if {[namespace tail $object] eq $object} {
        set fobject ::$object
    } else {
        set fobject $object
    }
    if {$fobject eq "::Class"} {
        return ::xotcl::Class
    } elseif {$fobject eq "::Object"} {
        return ::xotcl::Object
    }
    my getFullName $namespace $object
}

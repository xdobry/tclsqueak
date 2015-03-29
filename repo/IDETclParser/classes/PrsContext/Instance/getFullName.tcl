PrsContext instproc getFullName {} {
    my instvar object isTclproc isInstproc name namespace repository
    if {$isTclproc} {
        return [$repository getFullName $namespace $name]
    } else {
        if {$isInstproc} {
            return [list $object instproc $name]
        } else {
            return [list $object proc $name]
        }
    }
}

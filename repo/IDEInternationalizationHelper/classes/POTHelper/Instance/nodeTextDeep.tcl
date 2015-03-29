POTHelper instproc nodeTextDeep node {
    set rez ""
    foreach n [$node childNodes] {
        if {[$n nodeType] eq "TEXT_NODE"} {
            append rez [$n nodeValue]
        } else {
            append rez [my nodeTextDeep $n]
        }
    }
    return $rez
}

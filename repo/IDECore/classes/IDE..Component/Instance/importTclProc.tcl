IDE::Component instproc importTclProc procName {
    set parent [string trimleft [namespace qualifiers $procName] :]
    if {![info exists parent] || $parent eq ""} {
       set pgroup [ide::ldetect each [my getProcsGroupsObjects] {![$each withNamespace]}]
       if {$pgroup eq ""} {
           set pgroup [my createTclProcsGroup import]
       }
    } else {
       set pgroup [ide::ldetect each [my getProcsGroupsObjects] {[$each withNamespace] && [$each name] eq $parent}]
       if {$pgroup eq ""} {
          set pgroup [my createTclProcsGroup $parent 1]
       }
    }
    set procobj [$pgroup createProcForName [string trimleft $procName :]]
    $procobj import
}

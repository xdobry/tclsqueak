IDEDBConnectFrame instproc getConnectArgs {} {
    my instvar win parameter types
    foreach par $parameter type $types {
        switch $type {
           file {
               set v [$win.f${par} cget -text]
               if {$v ne ""} {  set pararr($par) $v}
           }
           wfile {
               set v [$win.f${par} cget -text]
               if {$v ne ""} {  set pararr($par) $v}
           }
           list {
               set pararr($par) [my set optionMenu$par]
           }
           default {
               set v [$win.$par get]
               if {$v ne ""} {  set pararr($par) $v}
           }
        }
    }
    return  [array get pararr]
}

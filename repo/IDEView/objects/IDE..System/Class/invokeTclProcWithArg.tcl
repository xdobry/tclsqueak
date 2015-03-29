IDE::System proc invokeTclProcWithArg {proc arg {defargumentsCount 0}} {
    if {$arg eq ""} {
       set r [$proc]
    } else {
       while 1 {
          set ret [IDE::IDialogEntry getValueWithCancel "$proc\ngive the parameter list\n$arg"]
          if {$ret eq "_cancel"} return
                   if {[lindex $arg end] eq "args" && [llength $ret]>=[llength $arg]-1-$defargumentsCount} break
          if {[llength $ret]<=[llength $arg] && [llength $ret]>=[llength $arg]-$defargumentsCount} break
          IDE::Dialog message {Wrong length of param list}
       }
       set r [namespace eval :: $proc $ret]
    }
    if {$r eq ""} {
        IDE::Dialog message "empty result from $proc \n args :[string range $r 0 30]"
     } else {
        my inspectString $r
     }
}

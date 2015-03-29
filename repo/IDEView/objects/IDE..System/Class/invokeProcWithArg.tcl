IDE::System proc invokeProcWithArg {object proc arg {defargumentsCount 0} {noposarg {}}} {
    if {$arg eq ""} {
       set r [$object $proc]
    } else {
       while 1 {
          set ret [IDE::IDialogEntry getValueWithCancel "$object $proc\ngive the parameter list\n$arg"]
          if {$ret eq "_cancel"} return
          # no check by nopos arguments TODO
          if {$noposarg ne ""} break
          if {[lindex $arg end] eq "args" && [llength $ret]>=[llength $arg]-1-$defargumentsCount} break
          if {[llength $ret]<=[llength $arg] && [llength $ret]>=[llength $arg]-$defargumentsCount} break
          IDE::Dialog message {Wrong length of param list}
       }
       set r [namespace eval :: [list $object $proc {*}$ret]]
    }
    if {$r eq ""} {
        IDE::Dialog message "empty result from $object $proc \n args :[string range $r 0 30]"
     } else {
        my inspectString $r
     }
}

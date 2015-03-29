IDEDBConnectDialog instproc getInterface {} {
    my instvar interface connectionObject userAction frame withSchemaExt
    if {[info exists connectionObject] && $connectionObject ne ""} return
    if {$interface ne ""} {
       my setInterface
       return
    }
    ::scrollbar $frame.scroll -command "$frame.listbox yview" -takefocus 0
    ::listbox $frame.listbox -yscroll "$frame.scroll set" -exportselection no
    pack $frame.scroll -side right -fill y
    pack $frame.listbox -expand yes -fill both

    $frame.listbox insert 0 {*}[Sqlinterface getInterfacesNamesCleaned]

    while {$interface eq "" && $userAction ne "cancel"} {
       my suspendUntilSignal
       if {$userAction eq "cancel"} break
       if {[set cur [$frame.listbox curselection]] ne ""} {
           set interface [$frame.listbox get $cur]
           my setInterface
       }
    }
    pack forget $frame.listbox $frame.scroll
}

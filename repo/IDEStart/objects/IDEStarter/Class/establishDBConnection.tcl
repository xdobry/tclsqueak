IDEStarter proc establishDBConnection {} {
    my instvar sqlhandle
    while 1 {
        if {[my set nodialog]} {
            set sqlhandle [my getConnectionObject]
            if {$sqlhandle eq ""} {
                error "no interface specified"
            }
            $sqlhandle connect [IDEPreferences getParameter connection]
        } else {
            set sqlhandle [IDEDBConnectDialog setConnectionOn [my getConnectionObject] [IDEPreferences getParameter connection]]
        }
        if {$sqlhandle eq "" || ![$sqlhandle isConnected]} {
            set res [tk_messageBox -title {Choose} -message "No connection to version control database. Do you want to have another try. Answer 'no' will exit the system." -icon question -type yesno]
            if {$res eq "no"} {
                exit 1
            }
        } else {
            return
        }
    }
}

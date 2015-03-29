IDE::DBPersistence instproc setTimeStamp value {
    my instvar timestamp
    if {[regexp {^\d{14}$} $value]} {
        set year [string range $value 0 3]
        set month [string range $value 4 5]
        set day [string range $value 6 7]
        set hour [string range $value 8 9]
        set minuts [string range $value 10 11]
        set seconds [string range $value 12 13]
        set timestamp "$day.$month.$year - ${hour}:${minuts}:${seconds}"
    } else {
        set timestamp $value
        catch {
            set timestamp [clock format [clock scan $value] -format {%x - %X}]
        }
        catch {
            set timestamp [clock format $value -format {%x - %X}]
        }
    }
}

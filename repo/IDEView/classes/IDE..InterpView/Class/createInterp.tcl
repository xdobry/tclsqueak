IDE::InterpView proc createInterp {name loadTk safeInterp} {
    if {$safeInterp} {
        if {$name eq ""} {
            set name [safe::interpCreate]
        } else {
            safe::interpCreate $name
        }
        if {$loadTk} {
            safe::loadTk $name
            interp alias $name tk_messageBox {} tk_messageBox
            interp eval $name {proc wm args { # ignore wm  }}
        }
    } else {
        if {$name eq ""} {
            set name [interp create]
        } else {
            interp create $name
        }
        if {$loadTk} {
            # for wikit the "package require Tk" takes a lot of time
            interp eval $name "load {} Tk"
        }
    }
    return $name
}

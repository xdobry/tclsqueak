IDEStarter proc startFromMenu {{tclkitMessage 0}} {
    my requireNamespace
    wm withdraw .
    my set idestart 1
    my parseCommandLineArgs
    my instvar startMode idestart
    if {[info exists startMode]} {
        switch $startMode {
            ideOnly {
                set idestart 1
            }
            ideDB {
                set idestart 2
            }
            ideFromDB {
                set idestart 3
            }
            installVC {
                set idestart 4
            }
            default {
                error "unrecognized startMode use: ideOnly | ideDB | ideFromDB | installVC"
            }
        }
        my invokeMenu
        return
    }
    if {![my set ignoreprefs]} {
        IDEPreferences loadPreferences
        if {[IDEPreferences isFirstStart]} {
            set answer [tk_messageBox -title "Setup" -message {Welcom! You are runing XOTclIDE for first time. Do you wish default setup?} -icon question -type yesno]
            if {$answer eq "yes"} {
                if {[my startStandardSetup]} {
                    return
                }
            }
        } else {
            if {[IDEPreferences getParameter startDefault]} {
                my set nodialog 1
                my startIDEFromDB
                return
            }
        }
    }
    set win [toplevel .startmenu]
    if {$tclkitMessage} {
        message $win.message -text "This is the tclkit wrapped XOTclIDE. The wrapped version does not contain all components and futures of XOTclIDE. To get full documentation check http://www.xdobry.de/xotclIDE. This wrapper contain sqlite database that is suitable for installing and running version control. There are other DB adapters for mysql, postgres, win odbc not contained in this wrapper.\nHave fun and report bugs" -width 350
        pack $win.message -fill x -expand yes
    }
    wm protocol .startmenu WM_DELETE_WINDOW exit
    radiobutton $win.startnormal -text {Start simple IDE (without Version Control)} -variable [self]::idestart -value 1
    radiobutton $win.startwithvc -text {Start IDE with Version Control} -variable [self]::idestart -value 2
    radiobutton $win.startfromvc -text {Start IDE load all from Version Control} -variable [self]::idestart -value 3
    radiobutton $win.startinstallvc -text {Install Version Control Database (relational database)} -variable [self]::idestart -value 4
    button $win.sbutton -text OK -command [list [self] invokeMenu]
    pack $win.startnormal $win.startwithvc $win.startfromvc $win.startinstallvc $win.sbutton -anchor w
}

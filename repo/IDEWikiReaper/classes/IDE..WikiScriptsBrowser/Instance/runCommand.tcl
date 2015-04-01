IDE::WikiScriptsBrowser instproc runCommand {} {
    my instvar win reaper isSafeInterp useTk
    set t [my @editor getText]
    if {$t eq ""} {
        IDE::Dialog message "no content. Load page first"
        return
    }
    if {![interp exists wiki]} {
        if {$isSafeInterp} {
            safe::interpCreate wiki
            if {$useTk} {
                safe::loadTk wiki
                interp alias wiki tk_messageBox {} tk_messageBox
                interp eval wiki {proc wm args { # ignore wm  }}
            }
            my setStatus "safe interpreter created"
        } else {
            interp create wiki
            if {$useTk} {
                # for wikit the "package require Tk" takes a lot of time
                interp eval wiki "load {} Tk"
            }
            my setStatus "interpreter created"
        }
        $win.nav.browse configure -state active
        $win.nav.delete configure -state active
    }
    if {[catch {interp eval wiki $t} res opts]} {
        my setStatus $res
        [interp bgerror wiki] $res $opts
    }
}

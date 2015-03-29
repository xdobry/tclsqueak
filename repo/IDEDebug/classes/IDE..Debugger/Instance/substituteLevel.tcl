IDE::Debugger instproc substituteLevel string {
    my instvar realLevel
    set err [catch {set ret [uplevel #$realLevel subst $string]} errInfo]
    if {!$err} {
        [self]::methodedit setEvaluationRet $ret
    } else {
        IDE::Dialog message "Fehler by evaluation $errInfo"
    }
}

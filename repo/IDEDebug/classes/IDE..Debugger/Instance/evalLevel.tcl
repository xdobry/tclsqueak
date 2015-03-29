IDE::Debugger instproc evalLevel string {
    my instvar realLevel
    set err [catch {set ret [uplevel #$realLevel $string]} errInfo]
    if {!$err} {
        [self]::methodedit setEvaluationRet $ret
    } else {
        IDE::Dialog message "Error by evaluation $errInfo"
    }
}

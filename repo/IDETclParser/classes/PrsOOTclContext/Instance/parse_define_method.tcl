PrsOOTclContext instproc parse_define_method {command notifier {instProc 1}} {
    my instvar repository name namespace isTclGlobalScript isInstproc object
    set isTclGlobalScript 0
    set isInstproc $instProc
    set objElem [$command getElem 1]
    if {[$objElem hasclass PrsLiteral]} {
        set objectName [$objElem prsString]
        set object [$repository getFullObjectName $objectName $namespace]
    } else {
        return
    }
    if {[$command argsCount]==2} {
        set isTclGlobalScript 1
        set body [$command getElem 2]
        $body evalContents
        $body visit [self]
        set isTclGlobalScript 0
    } else {
        my checkTclCommandInner $command $notifier 2
    }
    my cleanupLocalVars
    set isTclGlobalScript 1
}

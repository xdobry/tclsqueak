PrsITclContext instproc parse_body_method {functionName command notifier} {
    my instvar repository name namespace isTclGlobalScript isInstproc
    set isTclGlobalScript 0
    set isInstproc 1
    set startArg 2
    set argumentElem [$command getElem $startArg]
    incr startArg
    set bodyElem [$command getElem $startArg]
    if {[$repository getMethodDescriptionForObject $name $functionName $namespace] ne ""} {
        set isInstproc 0
    }
    my parseArguments $argumentElem $functionName
    my evalContents $bodyElem
    # check if the method is already regursterd as proc (static) if yes register as static
    if {[$repository getMethodDescriptionForObject $name $functionName $namespace] ne ""} {
        set desc [my registerMethod $functionName $bodyElem proc]
        $repository registerProc $functionName $desc [my joinNamespace $name]
    } else {
        my registerMethod $functionName $bodyElem
    }
    my cleanupLocalVars
    set isTclGlobalScript 1
}

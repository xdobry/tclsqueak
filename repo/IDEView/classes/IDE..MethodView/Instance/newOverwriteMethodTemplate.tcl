IDE::MethodView instproc newOverwriteMethodTemplate {} {
    my instvar vclass
    set introProxy [my getIntroProxy]
    if {![$introProxy isObjectClass $vclass]} {
        my upsMessage "$vclass is not a class"
        return
    }
    set methods [list]
    foreach c [$introProxy getHeritageFlatPrecedenceForClass $vclass] {
        if {$c in {::xotcl::Object ::oo::object}} continue
        lappend methods {*}[$introProxy getInstanceMethods $c]
    }
    set methods [lsort -unique $methods]
    ide::lremoveAll methods [$introProxy getInstanceMethods $vclass]
    if {[llength $methods]==0} {
        IDE::Dialog message "Nothing to overwrite"
        return
    }
    set procName [IDE::IDialogList getListItem {Select method to overwrite} $methods]
    set args {}
    foreach c [$introProxy getHeritageFlatPrecedenceForClass $vclass] {
        if {$procName in [$introProxy getInstanceMethods $c]} {
            set args [lindex [$introProxy getMethodParamDescForClass $c $procName] 0]
            break
        }
    }
    if {$procName eq ""} return
    set template [$introProxy getMethodTemplate $vclass $procName Instance]
    [my info parent]::methodedit setTextControler $template [self]
    my prepareNewMethodState
}

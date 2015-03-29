IDE::SystemConfigMap proc startScripts {} {
    my instvar preStartScript startScript
    global progdir xotclidedir
    set progdir $xotclidedir
    set run 0
    if {[info exists preStartScript] && $preStartScript ne ""} {
        namespace eval :: $preStartScript
        set run 1
    }
    if {[info exists startScript] && $startScript ne ""} {
        namespace eval :: $startScript
        set run 1
    }
    if {!$run} {
        IDE::Dialog message "There are no configuration map scripts to run"
    }
}

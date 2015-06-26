proc repobs::loadComponent {compName dir} {
    puts "load component $compName"
    loadRequirements $compName $dir
    if {![catch {package present $compName}]} {
        # package already loaded
        return
    }
    if {[namespace exists ::xotcl] && [Object isobject IDEStarter]} {
        if {[IDEStarter loadComponent $compName]} {
            puts "component $compName loaded from repo"
            return
        } else {
            puts "can not load component from repo $compName"
        }
    }
    set source [getComponent $compName $dir]
    namespace eval :: $source
    package provide $compName 1.0
    puts "component $compName loaded from file repo"
}

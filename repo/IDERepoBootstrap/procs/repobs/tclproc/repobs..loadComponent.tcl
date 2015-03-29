proc repobs::loadComponent {compName dir} {
    puts "load component $compName"
    loadRequirements $compName $dir
    if {![catch {package present $compName}]} {
        # package already loaded
        return
    }
    set source [getComponent $compName $dir]
    namespace eval :: $source
    package provide $compName 1.0
}

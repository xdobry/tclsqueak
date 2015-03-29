ErrorReporter proc getVersion {} {
     # Please init version class varible for your system
     # ErrorReporter set version 0.12"

     if {[my exists version]} { return [my set version]}
     return
}

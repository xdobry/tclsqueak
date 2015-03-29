ErrorReporter proc getAppName {} {
     # Please init version class varible for your system
     # ErrorReporter set appName XOTclIDE

     if {[my exists appName]} { return [my set appName]}
     return
}

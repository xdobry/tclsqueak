PrsOOBaseContext instproc checkArgCount {command startArg notifier min max} {
    set count [$command argsCount]
    if {$count-$startArg+1<$min || ($count-$startArg+1>$max && $max>0)} {
        #puts "error count=$count start=$startArg $min $max realcount=[expr {$count-$startArg+1}]"
        $notifier addError "wrong number of paramter expect $min to $max" [$command getElem [expr {$startArg-1}]]
        return 0
    }
    return 1
}

PrsArgumentMatcher instproc parseCommand {command notifier startArg descsAll} {
    my instvar parseErrors context fullName

    set parseErrors [list]
    set descs [lrange $descsAll 1 end]
    set fullName [lindex $descsAll 0]
    # is min max simplified description
    if {[ttype::isSimpleDesc $descs]} {
        set count [expr {[$command argsCount]+1-$startArg}]
        lassign $descs min max
        if {$count<$min || ($max!=-1 && $count>$max)} {
            $notifier addError "false argument count $count ($min,$max): $fullName" [$command getElem [expr {$startArg-1}]]
            return 0
        }
        return 1
    }
    set arguments [lrange [$command set list] $startArg end]

    # if argument expansion {*} then just apply as ok
    foreach a $arguments {
        if {[$a hasclass PrsArgumentExpansion]} {
            return 1
        }
    }


    my initSubcommands $descs
    foreach desc $descs {
        if {![catch {my parseCommandTypes $arguments [lrange [my prepareDesc $desc] 1 end]} types options]} {
            my applyTypes $arguments $types $notifier $descsAll
            [$command getElem [expr {$startArg-1}]] set desc $desc
            $command setType [lindex $desc 0 0]
            return 1
        } else {
            #puts "failed by $types $::errorInfo"
        }
    }
    if {![info exists parseErrors]} {
        #puts "no parseErrorElem [$command prsString] >>$::errorInfo $::errorCode"
        return -options $options $types
    }
    # search for best matched option
    set maxargs -1
    set i 0
    set maxargIndex -1
    foreach err $parseErrors {
         lassign $err parseErrorElem parseErrorMessage
         if {$parseErrorElem eq ""} {
             set argindex 0
         } else {
             set argindex [lsearch $arguments $parseErrorElem]
         }
         if {$argindex>$maxargs} {
             set maxargs $argindex
             set maxargIndex $i
         }
         incr i
    }

    lassign [lindex $parseErrors $maxargIndex] parseErrorElem parseErrorMessage
    if {$parseErrorElem eq ""} {
        set parseErrorElem [$command getElem [expr {$startArg-1}]]
    }
    $notifier addError $parseErrorMessage $parseErrorElem
    return 0
}

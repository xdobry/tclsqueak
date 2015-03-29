PrsITclContext instproc evalClassBody {command context notifier} {
    my instvar repository name namespace object varArr parameters superclasses
    set nameElem [$command getElem 1]
    if {[$nameElem hasclass PrsLiteral]} {
        set name [$nameElem prsString]
        set body [$command getElem 2]
        set object [$repository registerObject $name ::itcl::class ::itcl::object {} $namespace]
        $command set def [list object $object]
        set class [$repository getFullObjectName $name $namespace]
        my addVariable this {} $notifier [list class $class] [list instproc $name]

        $body evalContents
        $body visit [self]

        # register parameters in repository
        if {[llength $superclasses]==0} {
            lappend superclasses ::itcl::object
        }
        $repository registerObject $name ::itcl::class $superclasses $parameters $namespace

        # create create method
        set initDesc [$repository getMethodDescriptionForClasses $name init $namespace]

        set call [list]
        # return value
        lappend call [list [list class $class] "create instance of itcl $class"]
        # options from parameters
        set options [list option]
        set allParameters [list]
        foreach c [$repository getFullHeritage $class] {
            foreach p [$repository getClassParameters $c] {
                set type [$repository getVariableType $class instproc $p]
                if {$type eq "" || $type eq "def"} {
                    set type unknown
                }
                lappend allParameters $p
                lappend options -$p $type
            }
        }
        if {[llength $options]>0} {
            lappend call [list ? $options]
        }
        # arguments from init methods
        if {$initDesc ne ""} {
            foreach p [lrange [lindex $initDesc 1] 1 end] {
                lappend call $p
            }
        }
        set createDesc [list [linsert $call 1 [list string "instance name"]]]
        $repository registerMethod $class proc create $createDesc
        # create cget and configure methods
        set enumList [list]
        foreach p $allParameters {
            lappend enumList -$p
        }

        $repository registerMethod $class instproc cget [list [list unknown [list [concat enum $enumList]]]]
        set configureDesc [list]
        lappend configureDesc [list list]
        lappend configureDesc [list unknown [list $options]]
        lappend configureDesc [list list [concat enum $enumList]]
        $repository registerMethod $class instproc configure $configureDesc
    }
}

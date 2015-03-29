PrsOOTclContext instproc evalClassBody {command context notifier} {
    my instvar repository name namespace object varArr parameters superclasses isInstproc
    set nameElem [$command getElem 2]
    if {[$nameElem hasclass PrsLiteral]} {
        set name [$nameElem prsString]
        set creatorElem [$command getElem 0]
        if {![$creatorElem hasclass PrsLiteral]} {
            return
        }
        set creator [$repository getFullObjectName [$creatorElem prsString] $namespace]
        if {"::oo::class" ni [$repository getFullHeritage [$creatorElem prsString] $namespace]} {
            # it is object definition
            $repository registerObject $name $creator {} {} $namespace
            # todo we should check the constructor here
            return
        }
        set object [$repository registerObject $name $creator oo::object {} $namespace]
        $command set def [list object $object]
        set class [$repository getFullObjectName $name $namespace]

        if {[$command argsCount]<3} {
            return
        }
        set isInstproc 1
        set body [$command getElem 3]
        $body evalContents
        $body visit [self]

        # register parameters in repository
        $repository registerObject $name ::oo::class $superclasses $parameters $namespace

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
    }
}

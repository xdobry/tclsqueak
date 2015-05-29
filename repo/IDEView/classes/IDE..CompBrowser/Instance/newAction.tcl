IDE::CompBrowser instproc newAction {} {
    set cobj [my @compview getActualComponentObject]
    set newList {
        Component
        {Script Editor}
    }
    if {$cobj ne ""} {
        lappend newList Class Object Procedures
    }
    # TODO
    #if {[$cobj getOOType] eq "XOTcl"} {
    #    lappend newList {Unit Test Class} {UI Window}
    #}
    set ret [IDE::IDialogList getListItem New $newList]
    if {$ret eq ""} {
        return
    }
    switch -- $ret {
        Component {
            my @compview newComponent
        }
        Class {
            my classview classWizard new
        }
        Object {
            my classview newObjectWizard
        }
        Procedures {
            my classview newTclProcsGroup
        }
        {Script Editor} {
            IDE::Transcript newBrowser
        }
        default {
            error "not supported yet TBD"
        }
    }

}

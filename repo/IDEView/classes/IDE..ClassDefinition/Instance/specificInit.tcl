IDE::ClassDefinition instproc specificInit {} {
    my instvar win superclassList mode className parameter compVisibility

    set compVisibility 0

    frame $win.fname
    frame $win.buttons -relief raised -borderwidth 3
    frame $win.lframe
    frame $win.fpar

    ttk::entry $win.fname.name

    if {$mode eq "redefine"} {
        $win.fname.name insert 0 $className
        $win.fname.name configure -state disabled
        set actionText Redefine
    } else {
        set actionText Create
    }
    ttk::button $win.buttons.ok -text $actionText -command [list [self] actionCreate]
    ttk::button $win.buttons.cancel -text "Cancel" -command "destroy $win; [self] destroy" -underline 0

    pack $win.buttons.ok $win.buttons.cancel -side left

    IDE::NListView create [self]::classlist $win.lframe.classlist -notify [self] -doubleNotifyProc addItemToList
    IDE::NListView create [self]::@superclass $win.lframe.superclass -notify [self] -doubleNotifyProc removeItemFromList

    ttk::label $win.fname.lname -text Name

    pack $win.fname.lname $win.fname.name -side left

    #label $win.lsuperclasses -text Superclasses
    ttk::checkbutton $win.lframe.visibility -text "classes visible in component only" -variable [self]::compVisibility -command [list [self] setClassesList]


    ttk::button $win.lframe.addtolist -text << -command [list [self] addToList]
    ttk::button $win.lframe.delfromlist -text del -command [list [self] delFromList]
    ttk::button $win.lframe.upitem -text up -command [list [self] upListElem]
    ttk::button $win.lframe.downitem -text down -command [list [self] downListElem]

    pack $win.lframe.visibility -side bottom -anchor e
    pack $win.lframe.superclass -side left -expand yes -fill both
    pack $win.lframe.classlist -side right -expand yes -fill both
    pack $win.lframe.addtolist -anchor s -fill x
    pack $win.lframe.delfromlist -anchor n -fill x
    pack $win.lframe.upitem -fill x
    pack $win.lframe.downitem -fill x

    ttk::label $win.fpar.lparameter -text "parameter f.e. \"parameter1 {parameter2 default2} parameter3\""
    text $win.fpar.parameter -height 6
    if {$parameter ne ""} {
        $win.fpar.parameter insert 1.0 $parameter
    }
    pack $win.fpar.lparameter -anchor w
    pack $win.fpar.parameter -fill both -expand yes


    pack $win.fname -anchor w
    pack $win.lframe -expand 1 -fill both -pady 10
    pack $win.fpar -expand 1 -fill both
    pack $win.buttons -anchor w -ipady 10 -ipadx 6 -fill x

    set cancelscript [list [self] destroy]

    bind $win <Escape> $cancelscript
    bind $win <Alt-c> $cancelscript

    my @superclass setListUnsorted [ide::lcollect each $superclassList {string trimleft $each :}]
    my setClassesList
    next
    focus $win.fname.name
}

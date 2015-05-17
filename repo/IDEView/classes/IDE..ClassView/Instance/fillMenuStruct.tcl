IDE::ClassView instproc fillMenuStruct ms {
    $ms enablementHandler [self]
    $ms enableList isValidContext

    $ms addMenuItem [IDE::MenuCommand new -childof $ms -name Delete -command [list [self] dispatchWithSelected deleteClass] -enableList [list isValidSelection] -popdownMenu 1]
    $ms addCheckButton {Heritage View} [self]::treeView [list [self] changeHeritageView]
    $ms addMenuItem [IDE::MenuCommand new -childof $ms -name {Move To Comp.} -command [list [self] dispatchWithSelected moveToComp] -enableList [list isValidSelection] -popdownMenu 1]
    $ms addMenuItem [IDE::MenuCommand new -childof $ms -name {Copy Class/Object} -command [list [self] dispatchWithSelected copyClass] -enableList [list isValidSelection isSelectionNoGroup] -popdownMenu 1]

    $ms addSeparator
    $ms addMenuItem [IDE::MenuCommand new -childof $ms -name {New Class Wizard} -command [list [self] classWizard new] -popdownMenu 1]
    $ms addMenuItem [IDE::MenuCommand new -childof $ms -name {New Child Class Wizard} -command [list [self] classWizard newChild] -enableList [list isValidSelection isSelectionClass] -popdownMenu 1]
    $ms addMenuItem [IDE::MenuCommand new -childof $ms -name {Redefine Class Wizard} -command [list [self] classWizard redefine] -enableList [list isValidSelection isSelectionClass] -popdownMenu 1]
    $ms addMenuItem [IDE::MenuCommand new -childof $ms -name {New Object Wizard} -command [list [self] newObjectWizard] -popdownMenu 1]

    set tms ${ms}::tclprocs
    IDE::MenuStruct create $tms {Tcl Procs Group}
    $tms enablementHandler [self]
    $ms addCascadeMenu $tms
    $tms addCommand {New Group} [list [self] newTclProcsGroup]
    $tms addMenuItem [IDE::MenuCommand new -childof $tms -name {Rename} -command [list [self] dispatchWithSelected renameTclProcsGroup] -enableList [list isValidSelection isProcView]]
    $tms addMenuItem [IDE::MenuCommand new -childof $tms -name {Import from Namespace} -command [list [self] dispatchWithSelected importUnknownFromNamespace] -enableList [list isValidSelection isProcWithNamespace]]

    my menuInsertions $ms

    $ms addSeparator

    next

}

IDE::MethodView instproc fillMenuStruct ms {
    $ms enablementHandler [self]
    $ms enableList isValidContext

    [$ms addCommand {Back Method} [list [self] backMethod] {} {Alt-Left}] enableList noglobal
    [$ms addCommand {Forward Method} [list [self] forwardMethod] {} {Alt-Right}] enableList noglobal
    $ms addCheckButton {Show Inherited Methods} [self]::inheritedMethod [list [self] changeInheritedMethodView]
    $ms addSeparator
    $ms addCommand2 Delete [list [self] dispatchWithSelectedMulti deleteMethod] isValidSelection
    $ms addSeparator
    $ms addMenuItem [IDE::MenuCommand new -childof [self] -name {New Method Template} -command [list [self] newMethodTemplate] -popdownMenu 1 -accelerator {Control-k}]
    $ms addCommand2 {New Overwrite Method Template} [list [self] newOverwriteMethodTemplate]
    $ms addCommand2 {New initializeAfterLoad} [list [self] newInitializeAfterLoad]
    $ms addCommand3 {Convert To XOTcl-Method} [list [self] dispatchWithSelectedAll convertProcToMethod] isSelectionTclProc
    $ms addSeparator

    IDE::MenuStruct create ${ms}::searchText {Search Text} -popdownMenu 1
    $ms addCascadeMenu ${ms}::searchText
    ${ms}::searchText addCommand2 {Local} [list [self] searchText local] noglobal
    ${ms}::searchText addCommand2 {In Component} [list [self] searchText component] noglobal
    ${ms}::searchText addMenuItem [IDE::MenuCommand new -childof ${ms}::searchText -name All -command [list [self] searchText all] -popdownMenu 1 -enableList noglobal]

    IDE::MenuStruct create ${ms}::searchImplementors {Search Implementors} -popdownMenu 1
    $ms addCascadeMenu ${ms}::searchImplementors
    ${ms}::searchImplementors addCommand2 {Local} [list [self] searchImplementors local] isValidSelection
    ${ms}::searchImplementors addCommand2 {In Component} [list [self] searchImplementors component] isValidSelection
    ${ms}::searchImplementors addCommand2 {All} [list [self] searchImplementors all] isValidSelection
    IDE::MenuStruct create ${ms}::searchSenders {Search Senders} -popdownMenu 1
    $ms addCascadeMenu ${ms}::searchSenders
    ${ms}::searchSenders addCommand2 {Local} [list [self] searchSenders local] isValidSelection
    ${ms}::searchSenders addCommand2 {In Component} [list [self] searchSenders component] isValidSelection
    ${ms}::searchSenders addCommand2 {All} [list [self] searchSenders all] isValidSelection

    my menuInsertions $ms
    $ms addSeparator
    $ms addCommand2 {Invoke Procs} [list [self] dispatchWithSelected invokeProcs] [list isValidSelection isSelectionProc]
    $ms addCommand2 {Change Category} [list [self] dispatchWithSelectedAll moveToCategory] isValidSelection
    next
}

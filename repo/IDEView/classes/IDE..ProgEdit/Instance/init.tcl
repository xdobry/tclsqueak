IDE::ProgEdit instproc init args {
    next
    my instvar useEditMode syntaxHightlight beginReturn hasErrors isBraceHL isSelectionSilbing codeCompletion
    set useEditMode 1
    set syntaxHightlight 2
    set beginReturn 0
    set hasErrors 0
    set isBraceHL 0
    set isSelectionSilbing 0
    set codeCompletion [IDE::CodeCompletion new -childof [self]]
    
}

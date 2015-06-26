PrsMarkupVisitor instproc collectMarkups {tcontext tfileName} {
    my instvar markups fileName refCount currentDefs currentRefs context varLocalDefinitions files
    set markups [list]
    set currentDefs [list]
    set currentRefs [list]
    set context $tcontext
    set refCount 0
    set fileName $tfileName
    lappend files $tfileName
    set varLocalDefinitions [list]
    [$context set rootCommand] visit [self]
    my collectErrors
}

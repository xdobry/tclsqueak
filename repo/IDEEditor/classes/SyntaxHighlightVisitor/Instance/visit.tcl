SyntaxHighlightVisitor instproc visit element {
    my instvar context
    if {[$element hasclass PrsCommand]} {
        set first [$element getElem 0]
        if {[$first hasclass PrsLiteral]} {
            #my hightlightElement [$element getElem 0] tclproc
        }
    } elseif {[$element hasclass PrsVariable] || [$element hasclass PrsVariableRef]} {
        set varType [$context getVariableType [$element getVariableName]]
        if {[lindex $varType 0] in {unknown def}} {
            my hightlightElement $element variable -1
        } else {
            [my text] addVariable [$element begin] [$element end] [$element getVariableName]
        }
    } elseif {[$element hasclass PrsQuoted] && [$element hasQuote]} {
        my hightlightElement $element quoted
    } elseif {[$element hasclass PrsComment]} {
        my hightlightElement $element comment
    } elseif {[$element exists ref]} {
        #my hightlightElement $element ref
        [my text] addRef [$element begin] [$element end] [$element set ref]
    }
}

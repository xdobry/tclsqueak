PrsMarkupVisitor instproc visit elem {
    if {[$elem hasclass PrsVariable] || [$elem hasclass PrsVariableRef]} {
        my markupVariable $elem variable
    } elseif {[$elem hasclass PrsCommand]} {
        set first [$elem getElem 0]
        if {[$first hasclass PrsLiteral]} {
            my markup $first command
        }
    } elseif {[$elem hasclass PrsQuoted] && [$elem hasQuote]} {
        my markup $elem quote
    } elseif {[$elem hasclass PrsComment]} {
        my markup $elem comment
    }
    if {[$elem exists def]} {
        my addDef $elem
    }
    if {[$elem exists ref]} {
        my addRef $elem
    }
}

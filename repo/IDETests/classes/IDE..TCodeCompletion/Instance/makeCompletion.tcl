IDE::TCodeCompletion instproc makeCompletion code {
    my instvar codecompletion completiontemplate testclass
    set search {##code}
    set pos [string first $search $completiontemplate]
    set body [string replace $completiontemplate $pos [expr {$pos+[string length $search]-1}] $code]
    set position [expr {$pos+[string length $code]}]
    $codecompletion getCompletionList $body $position [list $testclass Instance bar]
}

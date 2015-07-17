IDE::TCodeCompletion instproc init args {
    my instvar testclass testns codecompletion completiontemplate
    set testclass ::CodeCompletionTestClass
    namespace eval :: {
Class create CodeCompletionTestClass
CodeCompletionTestClass instproc foow {a b} {
    my instvar ivar
    set ivar instance_var
    return 1        
}
CodeCompletionTestClass proc staticfoo {} {
    return static
}
    }
    set testns ::tcodecomplation::testns
    namespace eval $testns {
        proc nstest {} {
            return 1
        }
    }
    
    set completiontemplate {CodeCompletionTestClass instproc bar {a {b test}} {
    my instvar ivar2
    set c 2
    ##code
}        
    }
    set codecompletion [IDE::CodeCompletion new]
    [$codecompletion set repo] registerVariable $testclass instproc ivar {} string
    next
}

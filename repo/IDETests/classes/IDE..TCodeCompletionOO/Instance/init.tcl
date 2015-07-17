IDE::TCodeCompletionOO instproc init args {
    my instvar testclass codecompletion completiontemplate
    set testclass ::CodeCompletionTestClass
    namespace eval :: {
oo::class create CodeCompletionTestClass {
    variable cvar
}
oo::define CodeCompletionTestClass method foow {a b} {
    my variable ivar
    set ivar instance_var
    return 1        
}
oo::objdefine CodeCompletionTestClass method staticfoo {} {
    return static
}
    }
    
    set completiontemplate {oo::define CodeCompletionTestClass method bar {a {b test}} {
    my variable ivar2
    set c 2
    ##code
}        
    }
    set codecompletion [IDE::CodeCompletion new]
    [$codecompletion set repo] registerVariable $testclass instproc ivar {} string
    next
}

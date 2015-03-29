IDE::TScriptParsing instproc testIAparseITclNamespace {} {
    set context [PrsFileContext new -childof [self]]
    $context parseGlobal {
package require Itcl

itcl::class MyNamespace::MyClass {
    public {
        method MemberMethod {} {
            puts "yee"
        }
        method Foo {}
    }
}

itcl::body MyNamespace::MyClass::Foo {} {
    puts "I am a Foo proc"
}

set c [MyNamespace::MyClass create #auto]
$c Foo
}
    my assert {[llength [$context set errors]]==0} [$context set errors]
}

IDE::TScriptParsing instproc testIBparseITclError {} {
    set context [PrsFileContext new -childof [self]]
    set script {
package require Itcl
itcl::class MyNamespace::MyClass {
    public {
        proc Foo {value}
        proc ReportError {code}
    }
}

itcl::body MyNamespace::MyClass::Foo {value} {
    ReportError $value
}

itcl::body MyNamespace::MyClass::ReportError {code} {
    return -code error $code
}

    }
    $context parseGlobal $script

    my assert {[llength [$context set errors]]==0} [$context set errors]
}

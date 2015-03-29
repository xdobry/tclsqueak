IDE::TScriptParsing instproc testICProcSignatureCheck {} {
    set context [PrsFileContext new -childof [self]]
    set scrip {
package require Itcl

itcl::class MyNamespace::Shape {
    public {
        method SetName {name} {
        }
        method GetName {} {
            return name
        }
    }

}

itcl::class MyNamespace::MyClass {
    public {
        proc Foo {shape} {
            puts [$shape GetName]
            $shape ABC
        }
    }
}

set circle1 [MyNamespace::Shape ::#auto]
$circle1 SetName "Circle 1"

MyNamespace::MyClass::Foo $circle1

    }
    $context parseGlobal $scrip
    $context parseGlobal $scrip

    my assert {[llength [$context set errors]]==1} [$context set errors]
}

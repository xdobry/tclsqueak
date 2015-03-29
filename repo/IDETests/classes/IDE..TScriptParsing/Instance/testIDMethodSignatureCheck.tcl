IDE::TScriptParsing instproc testIDMethodSignatureCheck {} {
    set context [PrsFileContext new]
    set script {
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
        method Foo {shape} {
            puts [$shape GetName]
            $shape ABC
        }
    }
}

set circle1 [MyNamespace::Shape ::#auto]
$circle1 SetName "Circle 1"

set mclass [MyNamespace::MyClass ::#auto]

$mclass Foo $circle1

    }

    $context parseGlobal $script
    $context parseGlobal $script
    puts "test parseGlobal end"

    my assert {[llength [$context set errors]]==1} [$context set errors]

    puts "test after assert"

    $context destroy
}

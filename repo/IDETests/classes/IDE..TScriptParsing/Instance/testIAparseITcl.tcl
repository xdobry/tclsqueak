IDE::TScriptParsing instproc testIAparseITcl {} {
    set context [PrsFileContext new -childof [self]]
    $context parseGlobal {
package require Itcl

itcl::class MyClass {

    public {
        proc StaticProc {}
        method MemberMethod {}
    }
}

itcl::body MyClass::StaticProc {} {
    puts "I am a static proc"
}

itcl::body MyClass::MemberMethod {} {
    puts "I am a member method"
}

puts "Start of trial program"

MyClass::StaticProc

    }
    my assert {[llength [$context set errors]]==0} [$context set errors]
}

IDE::TclOOCheckerTest instproc testBobjdefine {} {
    set context [PrsFileContext new -childof [self]]
    $context parseGlobal {
package require TclOO

oo::class create c
c create o
oo::define c method foo {} {
    puts "world"
}
oo::objdefine o {
    method bar {} {
        my foo
    }
}
o bar
o foo
set obj [c new]
$obj foo

    }
    my assert {[llength [$context set errors]]==0} [$context set errors]
}

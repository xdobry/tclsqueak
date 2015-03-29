IDE::TSourceManaging instproc testGSaveComplex {} {
    my instvar cobj
    set target [file join [my getTestDir] xotcl_tests]
    file mkdir $target
    set tComps [list IDECore IDEView IDEBaseGUI]
    IDE::Component saveComplex $tComps 0 0 $target
    IDE::Component saveComplex $tComps 1 0 $target
    IDE::Component saveComplex $tComps 0 1 $target
    IDE::Component saveComplex $tComps 1 1 $target
    file delete -force $target    
}

IDE::TArgumentMatcher instproc testAMixedOptMandatoryArgs {} {
    my instvar errors argMatcher
    set desc {cmd
        {void {{mixedoptargs {-opt1 string -opt2 {}} string {* string}}}}
    }
    
    set cmd [my parse {cmd -opt1 string -opt2 mandatory}]
    my assert {[$argMatcher parseCommand $cmd [self] 1 $desc]} [list 1 $errors]

    set cmd [my parse {cmd -opt1 string -opt2 mandatory optional1 optional2}]
    my assert {[$argMatcher parseCommand $cmd [self] 1 $desc]} [list 2 $errors]

    set cmd [my parse {cmd mandatory -opt1 string -opt2}]
    my assert {[$argMatcher parseCommand $cmd [self] 1 $desc]} [list 3 $errors]

    set cmd [my parse {cmd -opt1 mandatory pstring -opt2 optional1}]
    my assert {[$argMatcher parseCommand $cmd [self] 1 $desc]} [list 4 $errors]
    
    set cmd [my parse {cmd -opt1 string -opt2}]
    my assert {[$argMatcher parseCommand $cmd [self] 1 $desc]==0} "expect mandatory"
    
    
    
}

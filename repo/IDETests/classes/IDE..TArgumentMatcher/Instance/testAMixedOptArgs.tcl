IDE::TArgumentMatcher instproc testAMixedOptArgs {} {
    my instvar errors argMatcher
    set desc {cmd
        {void {{mixedoptargs {-opt1 string -opt2 {}} {? string}}}}
    }
    
    set cmd [my parse {cmd -opt1 string -opt2}]
    my assert {[$argMatcher parseCommand $cmd [self] 1 $desc]} $errors

    set cmd [my parse {cmd -opt1 string -opt2 string}]
    my assert {[$argMatcher parseCommand $cmd [self] 1 $desc]} $errors

    set cmd [my parse {cmd pstring -opt1 string -opt2}]
    my assert {[$argMatcher parseCommand $cmd [self] 1 $desc]} $errors

    set cmd [my parse {cmd -opt1 string pstring -opt2}]
    my assert {[$argMatcher parseCommand $cmd [self] 1 $desc]} $errors
    
    set cmd [my parse {cmd -opt1 string -opt2 -opt3}]
    my assert {[$argMatcher parseCommand $cmd [self] 1 $desc]==0} "expect errors"
    
}

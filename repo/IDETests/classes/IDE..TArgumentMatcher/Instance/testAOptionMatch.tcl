IDE::TArgumentMatcher instproc testAOptionMatch {} {
    my instvar errors argMatcher
    set cmd [my parse {cmd -opt value arg1}]
    set desc {cmd {void {? {option -opt string -opt2 {}}} unknown}}
    my assert {[$argMatcher parseCommand $cmd [self] 1 $desc]} $errors
    set cmd [my parse {cmd arg1}]
    my assert {[$argMatcher parseCommand $cmd [self] 1 $desc]} $errors
    set cmd [my parse {cmd -opt2 12 arg1}]
    my assert {[$argMatcher parseCommand $cmd [self] 1 $desc]==0}
}

IDE::TArgumentMatcher instproc testASimpleMatch {} {
    my instvar errors argMatcher
    set cmd [my parse {string index art 1}]
    my assert {[$argMatcher parseCommand $cmd [self] 1 {string {void string string index}}]} $errors
}

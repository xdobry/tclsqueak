IDE::TArgumentMatcher instproc parse text {
    my instvar parser errors
    set errors {}
    $parser cleanUp
    [$parser stream] setString $text
    $parser getCommand $parser
}

IDE::TParser instproc testIMaskingCharParsing {} {
    # check parsing errors
    my initTestClass
    set script {TestA instproc t1 {a b} {
        puts ewewe\ atr
        puts {ewr\}}
        puts \{ewre
        puts "\""
        puts "\["
        puts \[\ \]
    }}
    set context [PrsContext new -childof [self]]
    $context parseAndCheck $script
    foreach elem [[[$context parser] root] list] {
        my assert {[$elem info class] eq "::PrsCommand"}
        my assert {[$elem argsCount]==1}
    }
}

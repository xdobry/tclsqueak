TestArgumentChecker instproc testAASimple {} {
    my assert {[my parseCommand {int int int} {int int int}]>=0}
    my assert {[my parseCommand {int int} {int int int}]<0}
    my assert {[my parseCommand {int int int} {int int}]<0}

}

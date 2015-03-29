TestArgumentChecker instproc testBAOptional {} {
    my assert {[my parseCommand {int int int} {int int int {? int}}]>=0}
    my assert {[my parseCommand {int int int} {int int {? string} int}]>=0}
    my assert {[my parseCommand {int int int} {int int {? unknown} int}]>=0}
    my assert {[my parseCommand {int int int} {int {? int} {? int}}]>=0}
    my assert {[my parseCommand {int} {{? int}}]>=0}

    my assert {[my parseCommand {int} {{? int} string}]<0}
    my assert {[my parseCommand {int} {{? string}}]<0}
}

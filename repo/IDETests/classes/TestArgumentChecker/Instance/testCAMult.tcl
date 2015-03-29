TestArgumentChecker instproc testCAMult {} {
    my assert {[my parseCommand {int int int} {{+ int}}]>=0}
    my assert {[my parseCommand {int int int} {int {* int}}]>=0}
    my assert {[my parseCommand {int int int} {int {+ int} {* string}}]>=0}
    my assert {[my parseCommand {int int int} {{* int} {* string}}]>=0}
    my assert {[my parseCommand {int int int} {{* string} {* int}}]>=0}

    my assert {[my parseCommand {int int int} {{+ string}}]<0}
    my assert {[my parseCommand {int int int} {int {+ int} string}]<0}
    my assert {[my parseCommand {int int int} {{* int} {+ string}}]<0}
    my assert {[my parseCommand {int int int} {{+ string} {* int}}]<0}

    my assert {[my parseCommand {int int int} {int {* unknown} int}]>=0}
    my assert {[my parseCommand {int int int} {int {? unknown} int int}]>=0}
    my assert {[my parseCommand {int int int} {int {* unknown} int int}]>=0}
    my assert {[my parseCommand {int int int} {int {+ unknown} int}]>=0}
    my assert {[my parseCommand {int int int int} {int {+ unknown} int int}]>=0}
    my assert {[my parseCommand {int int int int} {int {+ unknown} int}]>=0}
    my assert {[my parseCommand {int int int int} {int {+ unknown}}]>=0}
    my assert {[my parseCommand {int int int} {int {+ int} unknown}]>=0}

    my assert {[my parseCommand {int int int} {int {+ unknown} int int}]<0}

}

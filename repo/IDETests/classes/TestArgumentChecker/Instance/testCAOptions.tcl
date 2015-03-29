TestArgumentChecker instproc testCAOptions {} {
    my assert {[my parseCommand {int} {int {? {option -opt1 int -opt2 int -opt3 int}}}]>=0}
    my assert {[my parseCommand {int -opt1 int} {int {? {option -opt1 int -opt2 int -opt3 int}}}]>=0}
    my assert {[my parseCommand {int -opt1 int -opt2 int} {int {? {option -opt1 int -opt2 int -opt3 int}}}]>=0}
    my assert {[my parseCommand {-opt1 int -opt2 int int} {{? {option -opt1 int -opt2 int -opt3 int}} int}]>=0}
    my assert {[my parseCommand {int -opt1 int -opt2 int int} {int {? {option -opt1 int -opt2 int -opt3 int}} int}]>=0}
    my assert {[my parseCommand {int -opt1 int -opts -- int} {int {? {option -opt1 int -opt2 int -opts {}}} {? {const --}} int}]>=0}
    my assert {[my parseCommand {int -opt1 int -opts int} {int {? {option -opt1 int -opt2 int -opts {}}} {? {const --}} int}]>=0}

    my assert {[my parseCommand {format int -opt1 string} {{{const format}} int {? {option -opt1 string -opt2 int -opts {}}}}]>=0}

    my assert {[my parseCommand {int -opt1} {int {? {option -opt1 int -opt2 int -opt3 int}}}]<0}
    my assert {[my parseCommand {string} {int {? {option -opt1 int -opt2 int -opt3 int}}}]<0}
    my assert {[my parseCommand {int -fop1 int} {int {? {option -opt1 int -opt2 int -opt3 int}}}]<0}
    my assert {[my parseCommand {int -fop1 int -fopt2 int} {int {? {option -opt1 int -opt2 int -opt3 int}}}]<0}
    my assert {[my parseCommand {-op1 int -fopt2 int int} {int {? {option -opt1 int -opt2 int -opt3 int}} int}]<0}
    my assert {[my parseCommand {int -op1 int -fopt2 int int} {int {? {option -opt1 int -opt2 int -opt3 int}} int}]<0}
    my assert {[my parseCommand {int -fop1 int -opts -- int} {int {? {option -opt1 int -opt2 int -opts {}}} {? {const --}} int}]<0}
    my assert {[my parseCommand {int -op1 int -fopts int} {int {? {option -opt1 int -opt2 int -opts {}}} {? {const --}} int}]<0}

}

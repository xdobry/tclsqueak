TclExprParser instproc init {} {
    my instvar operatorsArr functionsArr

    array set functionsArr {
        abs {1 %n numeric}
        acos {1 double numeric}
        asin {1 double numeric}
        atan {1 double numeric}
        atan2 {2 double numeric numeric}
        bool {1 boolean boolean}
        ceil {1 double numeric}
        cos {1 double numeric}
        cosh {1 double numeric}
        double {1 double numeric}
        entier {1 int numeric}
        exp {1 double numeric}
        floor {1 double numeric}
        fmod {2 double numeric numeric}
        hypot {2 double numeric numeric}
        int {1 int numeric}
        isqrt {1 int numeric}
        log {1 double numeric}
        log10 {1 double numeric}
        max {-1 numeric}
        min {-1 numeric}
        pow {2 numeric numeric int}
        rand {0 double}
        round {1 int numeric}
        sin {1 double numeric}
        sinh {1 double numeric}
        sqrt {1 double numeric}
        srand {1 double int}
        tan {1 double numeric}
        tanh {1 double numeric}
        wide {1 int numeric}
    }

    # prority arity type
    array set operatorsArr {
         ( {100 1}
         -_ {0 1 {%n numeric}} +_ {0 1 {%n numeric}} ~ {0 1 {int int}} ! {0 1 {boolean boolean}}
         ** {1 1 {%n numeric numeric}}
         * {2 2 {%n numeric numeric}}
         / {2 2 {%n numeric numeric}}
         % {2 2 {int int int}}
         - {3 2 {%n numeric numeric}}
         + {3 2 {%n numeric numeric}}
         << {4 2 {int int int}} >> {4 2 {int int int}}
         < {5 2 {boolean numeric numeric}}
         > {5 2 {boolean numeric numeric}}
         <= {5 2 {boolean numeric numeric}}
         >= {5 2 {boolean numeric numeric}}
         == {6 2 {boolean numeric numeric}}
         != {6 2 {boolean numeric numeric}}
         eq {7 2 {boolean string string}}
         ne {7 2 {boolean string string}}
         in {8 2 {boolean string list}}
         ni {8 2 {boolean string list}}
         & {9 2 {int int int}}
         ^ {9 2 {int int int}}
         | {9 2 {int int int}}
         && {10 2 {boolean boolean boolean}}
         || {11 2 {boolean boolean boolean}}
         : {12 3 ? boolean unknown unknown}
         ? {13 3 ? boolean unknown unknown}
         , {1000 1 {}}
    }
    if {[PrsCheckerOptions set oldStringOp]} {
        array set operatorsArr {
            == {6 2 {boolean unknown unknown}}
            != {6 2 {boolean unknown unknown}}
        }
    }

}

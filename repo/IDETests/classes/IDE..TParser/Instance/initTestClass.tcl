IDE::TParser instproc initTestClass {} {
    namespace eval :: {
         Class TestA
         TestA instproc m1 {a} { puts test }
         TestA instproc m2 {} { puts test }
         TestA instproc m3 {a b {c 1}} { puts test }
         TestA instproc m4 {args} { puts test }
    }
}

IDE::SampleElements instproc addSampleObjects obj {
    namespace eval :: {
         Class TestA
         TestA instproc m1 {} { puts test }
         TestA instproc m2 {} { puts test }
         Class TestB -superclass TestA
         TestB instproc m1 {} { puts test }
         TestB instproc m2 {} { puts test }
         Object TestC
         TestC proc m1 {} { puts test }
         TestC proc m2 {} { puts test }
    }
    set name [$obj getName]
    set introProxy [IDE::XOIntroProxy getIntroProxy]
    $introProxy moveToComponent TestB $name
    $introProxy moveToComponent TestA $name
    $introProxy moveToComponent TestC $name
}

IDE::TImportingSource instproc testAMakeSampleFile {} {
    set file [open [my getFileName] w]
    puts $file {
        Class TestA
        TestA instproc m1 {} { puts test }
        TestA instproc m2 {} { puts test }
        Class TestB -superclass TestA
        TestB instproc m1 {} { puts test }
        TestB instproc m2 {} { puts test }
        Object TestC
        TestC proc m1 {} { puts test }
        TestC proc m2 {} { puts test }
        proc testProc {} {puts testProc}
        Class MetaTestClass -superclass Class
        MetaTestClass MTest
        MTest instproc m3 {} { puts mctest }
    }
    close $file
}

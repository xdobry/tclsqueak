IDE::TPersistence instproc testFIARereadForObject {} {
    # test versioning and loading versions of objects
    my instvar compObj
    set mobj [$compObj getObject TestA]
    set oldid [$mobj set objectid]
    $mobj versionEdition
    $mobj createNewEdition
    set newid [$mobj set objectid]
    my assert {$newid!=$oldid}
    my assert {[$mobj set basedon]==$oldid}
    namespace eval :: {
         # modify method
         TestA instproc m1 {} {
             puts modified2
         }
         # new method
         TestA instproc m4 {} {
             puts modified2
         }
         # delete method
         TestA instproc m2 {} {}
         TestA parameter testParam
    }

    $mobj changeVersionTo $oldid
    my assert {$oldid==[$mobj set objectid]}

    my assert {[TestA info instprocs m2] ne ""}
    my assert {[TestA info instprocs m4] eq ""}
    my assert {![regexp modified2 [TestA info instbody m1]]}
    my assert {[TestA info parameter] eq ""}
}

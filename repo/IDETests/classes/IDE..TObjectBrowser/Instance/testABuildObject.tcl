IDE::TObjectBrowser instproc testABuildObject {} {
    Class TOBExample 
    TOBExample instproc foo {} {
       puts foo
    }
    TOBExample instproc foo2 {} {
       puts foo2
    }
    TOBExample tobExample
    TOBExample tobExample::subObject
    tobExample set varFoo test
}

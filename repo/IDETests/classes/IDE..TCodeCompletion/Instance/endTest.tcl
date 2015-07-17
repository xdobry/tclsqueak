IDE::TCodeCompletion instproc endTest {} {
    my instvar testclass codecompletion testns
    if {[Object isobject $testclass]} {
        $testclass destroy
    }
    if {[namespace exists $testns]} {
        namespace delete $testns
    }
    catch {$codecompletion destroy}
}

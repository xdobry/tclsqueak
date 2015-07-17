IDE::TCodeCompletionOO instproc endTest {} {
    my instvar testclass codecompletion
    if {[info object isa object $testclass]} {
        $testclass destroy
    }
    catch {$codecompletion destroy}
}

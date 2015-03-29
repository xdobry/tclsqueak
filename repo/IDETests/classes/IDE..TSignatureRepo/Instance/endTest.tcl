IDE::TSignatureRepo instproc endTest {} {
    my instvar repo
    catch {$repo destroy}
    return 1
}

IDE::ComponentPersistence instproc removeClass obj {
    set introProxy [my getIntroProxy]
    set desc [$introProxy getDescriptionForObject $obj]
    if {$desc ne ""} {
        $desc makeTransistent
    }
    next
}

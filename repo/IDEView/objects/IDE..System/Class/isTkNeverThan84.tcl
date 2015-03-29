IDE::System proc isTkNeverThan84 {} {
    global tk_version
    expr {$tk_version>=8.4}
}

IDE::TkWindowControler instproc closeWindowClass class {
    update idletasks
    foreach inst [$class info instances] {
        $inst destroy
    }
}

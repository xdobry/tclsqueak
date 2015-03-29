IDE::RegexpBrowser instproc changeSampleWrap args {
    my instvar data v_wrap
    $data(w:sample) configure -wrap $v_wrap
}

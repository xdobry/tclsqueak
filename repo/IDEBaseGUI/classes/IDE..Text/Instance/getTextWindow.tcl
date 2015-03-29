IDE::Text instproc getTextWindow {} {
    #ttc rettype tk ::Text

    return [my set win].text
}

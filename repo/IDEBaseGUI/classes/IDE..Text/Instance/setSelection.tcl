IDE::Text instproc setSelection {begin end} {
    set twin [my set win].text
    $twin tag add sel  $begin $end
    $twin mark set insert sel.last
}

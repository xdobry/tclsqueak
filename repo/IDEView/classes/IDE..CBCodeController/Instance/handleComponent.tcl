IDE::CBCodeController instproc handleComponent {skript contentDesc} {
    next
    [my info parent] methodedit notifyNotEdited $contentDesc
}

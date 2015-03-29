IDE::ObjectDescription instproc getObjectName {} {
    return [string trimleft [my info parent] :]
}

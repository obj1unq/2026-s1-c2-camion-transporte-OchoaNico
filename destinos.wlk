object almacen {
    const almacenamiento = #{}

    method almacenarCosa(cosa) {
        almacenamiento.add(cosa)
    }

    method almacenamiento() {
        return almacenamiento
    }

    method almacenarCosas(cosas) {
        almacenamiento.addAll(cosas)
        cosas.clear()
    }

}
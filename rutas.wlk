import camion.*
object ruta9{
    const maximoDePeligro = 20

    method puedeCircular(camion) {
      return !(camion.estaExcedido()) && (#{} == camion.cosasQueTenganPeligroMayorA(maximoDePeligro))
    }

    method maximoDePeligro(){
        return maximoDePeligro
    }

}

object caminosVecinales {

    var pesoMaximoPermitido = 2000
  
    method pesoMaximoPermitido(_pesoMaximoPermitido) {
        pesoMaximoPermitido = _pesoMaximoPermitido
    }

    method puedeCircular(camion) {
        return camion.pesoTotal() <= pesoMaximoPermitido
    }

}
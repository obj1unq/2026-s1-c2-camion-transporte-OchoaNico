import cosas.*

object camion {
	const property cosas = #{}

	const pesoDelCamionVacio = 1000

	method transportar(destino, ruta) {
		self.validarTransporte(ruta)
		destino.almacenarCosas(self.cosas())
	}

	method validarTransporte(ruta) {
		if(!(self.puedeCircularEnRuta(ruta))){
			self.error("No puede circular")
		}
	}

	method sufrirAccidente() {
		cosas.forEach({cosa=> cosa.efecto()})
	}

	method cantidadDeBultos() {
		return cosas.sum({cosa=> cosa.bulto()})
	}

	method pesoDeTodasLasCosas(){
		return cosas.map({cosa=> cosa.peso()}).asSet()
	}

	method laCosaMasPesada() {
		return cosas.max({cosa=> cosa.peso()})
	}

	method algunaCosaPesaDeHasta(valorMinimo, valorMaximo) {
		return cosas.any({cosa=> valorMaximo >= cosa.peso() && cosa.peso() >= valorMinimo})
	}

	method puedeCircularEnRuta(ruta) {
		return ruta.puedeCircular(self)
	}

	method cosasQueTenganPeligroMayorA(peligroDado) {
		return cosas.filter({cosa=>cosa.nivelPeligrosidad() > peligroDado})
	}

	method cosasQueSeanMasPeligrosasQue(cosaDada){
		return cosas.filter({cosa=>cosa.nivelPeligrosidad() > cosaDada.nivelPeligrosidad()})
	}
		
	method encontrarCosaConNivelDePeligro(nivelDado){
		return cosas.find({cosa=>cosa.nivelPeligrosidad() == nivelDado})
	}

	method estaExcedido() {
		return self.pesoTotal()>2500
	}

	method pesoTotal() {
		return cosas.sum({cosa=> cosa.peso()}) + pesoDelCamionVacio
	}

	method cosas(){
		return cosas
	}

	method todasLasCosasTienenPesoPar() {
		return cosas.all({cosa=> (cosa.peso() % 2) == 0})
	}

	method algunaCosaPesa(pesoDado) {
		return cosas.any({cosa=> cosa.peso() == pesoDado})
	}

	method cargar(unaCosa) {
		self.validarCarga(unaCosa)
		cosas.add(unaCosa)
	}

	method validarCarga(unaCosa) {
		if(cosas.contains(unaCosa)){
			self.error(unaCosa+" ya esta dentro del camion")
		}
	}

	method descargar(unaCosa){
		self.validarDescarga(unaCosa)
		cosas.remove(unaCosa)
	}

	method validarDescarga(unaCosa) {
		if (!(cosas.contains(unaCosa))){
			self.error(unaCosa+ "no esta dentro del camion")
		}
	}

}

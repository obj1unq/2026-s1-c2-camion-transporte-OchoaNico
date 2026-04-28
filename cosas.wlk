object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
	method bulto(){return 1}
	method efecto() {}
}

object contenedorPortuario {
	const pesoDelContenedor = 100

	const peligroDelContedor = 0

	const bultoDelContenedor = 1

	const contenido = #{}

	method efecto(){
		contenido.forEach({cosa=>cosa.efecto()})
	}

	method nivelPeligrosidad() {
		if (contenido.isEmpty()){
			return peligroDelContedor
		} else {
		return contenido.max({cosa=> cosa.nivelPeligrosidad()}).nivelPeligrosidad()
		}
	}

	method bulto(){
		return contenido.sum({cosa=> cosa.bulto()}) + bultoDelContenedor
	}

	method añadirAContenido(cosa) {
		contenido.add(cosa)
	}

	method peso() {
		return pesoDelContenedor + contenido.sum({cosa=> cosa.peso()})
	}


}

object embalajeDeSeguridad {
	var cosaEmbalada = knightRider

	method cosaEmbalada(_cosaEmbalada) {
		cosaEmbalada = _cosaEmbalada
	}

	method efecto() {
	  
	}

	method bulto(){
		return 2
	}

	method peso() {
		return cosaEmbalada.peso()
	}

	method nivelPeligrosidad() {
		return cosaEmbalada.nivelPeligrosidad() / 2
	}

}

object arenaAGranel {
	var peso = 0

	method efecto() {
		peso = peso + 20
	}

	method peso(){ return peso}

	method peso(_peso){ peso=_peso}

	method nivelPeligrosidad(){ return 1}

	method bulto(){ return 1}
}

object bumbleBee {
	var nivelPeligrosidad = 15

	method peso(){ return 800}

	method efecto() {
		if(nivelPeligrosidad == 15){
			nivelPeligrosidad = 30
		} else {
			nivelPeligrosidad = 15
		}
	}

	method transFormarseEnAuto() {
		nivelPeligrosidad = 15
	}

	method bulto(){
		return 2
	}

	method transFormarseEnRobot(){
		nivelPeligrosidad = 30
	}

	method nivelPeligrosidad(){
		return nivelPeligrosidad
	}
}

object paqueteDeLadrillos{
	var cantidad = 0
	const pesoDeLadrillo = 2

	method nivelPeligrosidad(){
		return 2
	}

	method efecto() {
		if(cantidad <= 12){
			cantidad = 0
		} else {
			cantidad = cantidad - 12
		}
	}

	method bulto(){
		if (cantidad > 300){
			return 3
		} else if (cantidad > 100){
			return 2
		} else {
			return 1
		}
	}

	method cantidad() {
		return cantidad
	}

	method cantidad(_cantidad){
		cantidad = _cantidad
	}

	method peso(){
		return cantidad * pesoDeLadrillo
	}

}

object bateriaAntiaerea {
	var tieneMisiles = false

	method efecto() {
		if(tieneMisiles){
			tieneMisiles = false
		}
	}

	method tieneMisiles() {
		return tieneMisiles
	}

	method tieneMisiles(_tieneMisiles){
		tieneMisiles = _tieneMisiles
	}

	method peso(){
		if (tieneMisiles){
			return 300
		} else {
			return 200
		}
	}

	method bulto(){
		if(tieneMisiles){
			return 2
		} else {
			return 1
		}
	}

	method nivelPeligrosidad(){
		if(tieneMisiles){
			return 100
		} else {
			return 0
		}
	}

}

object residuosRadiactivos{
	var peso = 0

	method efecto() {
		peso = peso + 15
	}

	method peso(_peso){
		peso = _peso
	}

	method peso() {
		return peso
	}

	method bulto(){
		return 1
	}

	method nivelPeligrosidad(){
		return 200
	}
}



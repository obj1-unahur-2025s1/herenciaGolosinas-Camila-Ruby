import golosinas.*

class Persona {
	const golosinas = []
	 
	method comprar(golosina) { golosinas.add(golosina) }
	method comprarVarias(listaGolosinas){ golosinas.addAll(listaGolosinas)}
	
	method desechar (golosina) { golosinas.remove(golosina) }
	
	method golosinas() { return golosinas }
	method primerGolosina() { return golosinas.first() }
	method ultimaGolosina() { return golosinas.last() }
	
	method pesoGolosinas() { 
		return golosinas.sum({ g => g.peso() })
	}
	
	method probarGolosinas() {
		golosinas.forEach( {g => g.mordisco() } )
	}
	
	method golosinaMasPesada() { 
		return golosinas.max({ g => g.peso() })
	}
	
	method hayGolosinaSinTACC() {
		return golosinas.any({ g => g.libreGluten()}) 
	}
	
	method preciosCuidados() {
		return golosinas.all({ g => g.precio() < 10}) 
	}
	
	
	
	method golosinaDeSabor(_sabor) {
		return golosinas.find({ g => g.sabor() == _sabor })
	}
	
	method golosinasDeSabor(_sabor) {
		return golosinas.filter({ g => g.sabor() == _sabor })
	}
	
	method sabores() {
		return golosinas.map({ g => g.sabor() }).asSet()
	}



	method golosinaMasCara() {
		return golosinas.max( { golosina => golosina.precio() } )
	}

	method golosinasFaltantes(golosinasDeseadas) {
		return golosinasDeseadas.difference(golosinas)	
	}


	method saboresFaltantes(saboresDeseados) {
		return saboresDeseados.filter({s => ! self.tieneGolosinaDeSabor(s)})	
	}
	
	method tieneGolosinaDeSabor(unSabor) {
		return golosinas.any({golosina => golosina.sabor() == unSabor})
	}
}
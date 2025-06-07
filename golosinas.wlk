import personas.*
/*
 * Los sabores
 */
object frutilla { }
object chocolate { }
object vainilla { }
object naranja { }
object limon { }


/*
 * Golosinas
 */
class Golosina {
	var peso = 15
	var libreGluten = true
	method peso()= peso
	method libreGluten() = libreGluten
	method calcularEspacio(estanteria) = peso + 25 < estanteria
}

class Bombon inherits Golosina{
	

	method precio() { return 5 }
	method mordisco() { peso = peso * 0.8 - 1 }
	method sabor() { return frutilla }
}

class BombonDuro inherits Bombon{
	override method mordisco(){ peso -=1}
	method gradoDeDureza()= if (peso >12) 3 else (if (peso.between(8, 12)) 2 else 1)

}


class Alfajor inherits Golosina(libreGluten = false){

	
	method precio() { return 12 }
	method mordisco() { peso = peso * 0.8 }
	method sabor() { return chocolate }
}

class Caramelo inherits Golosina(peso = 5){
	
	var property sabor = frutilla
	method precio() { return 12 }
	method mordisco() { peso = peso - 1 }
}

class CarameloCorazonChoco inherits Caramelo{
	
	override method precio() = super() +1
	override method mordisco() {
		super()
		sabor = chocolate

	}
}



class Chupetin inherits Golosina(peso = 7){
	method precio() { return 2 }
	method mordisco() { 
		if (peso >= 2) {
			peso = peso * 0.9
		}
	}
	method sabor() { return naranja }
}

class Oblea {
	var peso = 250
	
	method precio() { return 5 }
	method peso() { return peso }
	method mordisco() {
		if (peso >= 70) {
			// el peso pasa a ser la mitad
			peso = peso * 0.5
		} else { 
			// pierde el 25% del peso
			peso = peso * 0.75
		}

		//peso = peso * (1- if peso >= 70 0.5 else 0.75)
	}	
	method sabor() { return vainilla }
	method libreGluten() { return false }
}

class ObleaCrujiente inherits Oblea{
	var cantMordiscos = 0
	override method mordisco(){
		super()
		if(cantMordiscos <= 3) peso -=3 
		cantMordiscos += 1
	}
	method estaDebil() = cantMordiscos > 3
}

class Chocolatin {
	// hay que acordarse de *dos* cosas, el peso inicial y el peso actual
	// el precio se calcula a partir del precio inicial
	// el mordisco afecta al peso actual
	var pesoInicial
	var comido = 0
	
	method pesoInicial(unPeso) { pesoInicial = unPeso }
	method precio() { return pesoInicial * 0.50 }
	method peso() { return (pesoInicial - comido).max(0) }
	method mordisco() { comido = comido + 2 }
	method sabor() { return chocolate }
	method libreGluten() { return false }

}
class ChocolatinVip inherits Chocolatin{
	method humedad() = heladera.humedad() 
	override method peso(){
		return super() * (1 + self.humedad())
	}
}
class ChocolatinPremium inherits ChocolatinVip{
	override method humedad() = super() * 0.5
	
}

class GolosinaBaniada {
	var golosinaInterior
	var pesoBanio = 4
	
	method golosinaInterior(unaGolosina) { golosinaInterior = unaGolosina }
	method precio() { return golosinaInterior.precio() + 2 }
	method peso() { return golosinaInterior.peso() + pesoBanio }
	method mordisco() {
		golosinaInterior.mordisco()
		pesoBanio = (pesoBanio - 2).max(0) 
	}	
	method sabor() { return golosinaInterior.sabor() }
	method libreGluten() { return golosinaInterior.libreGluten() }	
}


class Tuttifrutti {
	var libreDeGluten
	const sabores = [frutilla, chocolate, naranja]
	var saborActual = 0
	
	method mordisco() { saborActual += 1 }	
	method sabor() { return sabores.get(saborActual % 3) }	

	method precio() { return (if(self.libreGluten()) 7 else 10) }
	method peso() { return 5 }
	method libreGluten() { return libreDeGluten }	
	method libreGluten(valor) { libreDeGluten = valor }
}
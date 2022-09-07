import golosinas.*

object mariano {
	// para este objeto no damos pistas
	// definimos algunos métodos para que compile el test
	var golosinas = []
	var golosinasDesechadas = []
	method comprar(unaGolosina) { golosinas.add(unaGolosina) }
	method comprarVarias(lista) { golosinas.addAll(lista)}
	method vaciarBolsa() { golosinas.clear()}
	method quitarGolosina(unaGolosina){
		golosinas.remove(unaGolosina)
		golosinasDesechadas.add(unaGolosina)
	}
	method cantidadDeGolosinas() = golosinas.size()
	method tieneLaGolosina(unaGolosina) {return golosinas.contains(unaGolosina)}
	method probarGolosinas() = golosinas.forEach({ g => g.mordisco()})
	method hayGolosinaSinTACC() = golosinas.any({g => g.libreGluten()})
	method hayGolosinasSinTACCconAll() =  golosinas.all({g => !g.libreGluten()})
	method preciosCuidados()=  golosinas.all({g => g.precio() <= 10})
	method golosinaDeSabor(unSabor) = golosinas.find({ g => g.gusto() == unSabor})
	method golosinasDeSabor(unSabor) = golosinas.filter({g => g.gusto() == unSabor})
	method sabores() = golosinas.map({g => g.gusto()}).asSet()
	method golosinaMasCara() = golosinas.max({g=> g.precio()})
	method precioGolosinaMasCara() = self.golosinaMasCara().precio()
	method pesoGolosina() = golosinas.sum{g => g.peso()}
	method golosinasFaltantes(golosinasDeseadas) = golosinasDeseadas.asSet().difference(golosinas.asSet())
	method gustosFaltantes(gustosDeseados) = gustosDeseados.asSet().difference(self.sabores())
	
	// metodos del desafio
	method gastoEn(unSabor) = self.golosinasDeSabor(unSabor).sum({g => g.precio()})
	method precioGolosinaMasCaraDeUnSabor(sabor) = self.golosinaDeSabor(sabor).max({g => g.precio()}).precio()
	method cantGolosinasDeUnSabor(unSabor) = self.golosinasDeSabor(unSabor).size()
	method saborMasPopular() = self.sabores().max({sabor => self.cantGolosinasDeUnSabor(sabor)})
	// method saborMasPesado() = self.sabores().max({sabor => self.cantGolosinasDeUnSabor(sabor)})
	method comproYDesecho(golosina) = golosinasDesechadas.contains(golosina)
}

object rolando {
 
    const mochila  = #{}
    const historialArtefactos = []
    var property capacidadMochila = 2
    var property hogar = castillo
    var property poderBase = 5
    var property enemigoActual = caterina

    method poderDeBatalla(){
       return  poderBase + mochila.sum({artefacto => artefacto.poder()})        
    }

    method mochila(){
        return mochila
    }

    method puedeRecolectar(){
        return mochila.size() < capacidadMochila 
    }

    method encontrar(artefacto){
        historialArtefactos.add(artefacto)
        if(self.puedeRecolectar() ){
            mochila.add(artefacto)
        }
    }

    method dejarObjetosEnHogar(){
        hogar.almacen().addAll(mochila)
        mochila.clear()
    }

    method posesiones(){
        return mochila + hogar.almacen()
    }

    method hayAlmenosUn(artefacto){
        return mochila.contains(artefacto)
    }

    method historialArtefactos(){
        return historialArtefactos
    }

    method batalla(){
        mochila.forEach({artefacto => artefacto.batalla()})
        poderBase = poderBase + 1
    }

    method enemigosMenosFuertes(){
        return [caterina, archibaldo, astra].filter({enemigo => enemigo.poderDeBatalla() < self.poderDeBatalla()})
    }

    method hogaresConquistables(){
        return self.enemigosMenosFuertes().map({enemigo => enemigo.hogar()})
    }

    method esElMasPoderoso(){
        return self.enemigosMenosFuertes() == [caterina, archibaldo, astra]
    }

    method tieneArtefactoFatal(){
        return mochila.any({artefacto => artefacto.poder(self) > enemigoActual.poderDeBatalla()})
    }

    method artefactoFatal(){
        mochila.find({artefacto => artefacto.poder(self) > enemigoActual.poderDeBatalla()})
    }

}

/////// ENEMIGOS

object caterina {

    var property poderDeBatalla = 28
    var property hogar = "fortalezaDeAcero"

}
object archibaldo {

    var property poderDeBatalla = 16
    var property hogar = "palacioDeMarmol"

}

object astra {

    var property poderDeBatalla = 14
    var property hogar = "torreDeMarfil"

}


///// HECHIZOS

object bendicion {
    method poderDeBatalla(personaje) = 4
}

object invisibilidad {
    method poderDeBatalla(personaje){
        return personaje.poderBase()
    }
}

object invocacion {
    method poderDeBatalla(personaje){
        return self.artefactoMasPoderosoEnMorada(personaje.hogar()).poder()
    }

    method artefactoMasPoderosoEnMorada(hogar){
        return hogar.almacen().max({artefacto => artefacto.poder()})
    }
}


///// ARTEFACTOS


object libroDeHechizos{

    const property hechizos = []

    method poderDeBatalla(personaje){
        return if(hechizos.isEmpty()){
             0
        } else {
           hechizos.first().poderDeBatalla(personaje) 
        }
    }

    method batalla(){
      if(not hechizos.isEmpty()){
          hechizos.remove(hechizos.first())
      }
    }
}


object collarDivino{
    
    var usos = 0

    method usos(){
        return usos
    }

    method poder(personaje){
       return if(personaje.poderBase() > 6){
             3 + usos
        } else {
            3
        }
    }

    method batalla(){
        usos = usos +1
    }

}
object armaduraDeAceroValyrio{

    method poder(perosnaje) {
        return 6
    }

    method batalla(){}

}

object espadaDelDestino{

    var fueUsada = false

    method poder(personaje){
        return if(fueUsada){
           personaje.poderBase() / 2
        } else {
           personaje.poderBase()
        }
           personaje.poderBase()
    }

    method batalla(){
        fueUsada = true
    }

}

//// HOGAR

object castillo {
    const almacen = #{}

    method almacen() {
        return almacen
    } 

}



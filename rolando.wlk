object rolando {
 
    const mochila  = #{}
    var capacidadMochila = 2
    var hogar = castillo
    const historialArtefactos = []
    var poderBase = 5
    var poderDeBatalla = 0

    method poderDeBatalla() {
        return poderDeBatalla
    }

    method calcularPoderDeBatalla(){
        poderDeBatalla = poderBase + mochila.sum({artefacto => artefacto.poder()})        
    }

    method poderBase(){
        return poderBase
    }

    method poderBase(_poderBase){
        poderBase = _poderBase
    }

    method capacidadMochila() {
        return capacidadMochila
    }

    method  capacidadMochila(_capacidadMochila){
        capacidadMochila = _capacidadMochila
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

    method  hogar() {
        return hogar
    }

    method hogar(_hogar){
        hogar = _hogar
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

    method enemigosMenosFuertes(){
        return [caterina, archibaldo, astra].filter({enemigo => enemigo.poderDeBatalla() < self.poderDeBatalla()})
    }

    method hogaresConquistables(){
        return self.enemigosMenosFuertes().map({enemigo => enemigo.hogar()})
    }

    method esElMasPoderoso(){
        return self.enemigosMenosFuertes() == [caterina, archibaldo, astra]
    }

    
}

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


object bendicion {
    var property poder = 4
}
object invisibilidad {
    var poder = 0

    method poder(){
        return poder
    }

    method calcularPoder(){
        poder = libroDeHechizos.personajeActual.poderBase()  
    }

}
object invocacion {

    var poder = 0

    method poder(){
        return poder
    }

    method calcularPoder(){
        poder = libroDeHechizos.personajeActual().hogar().almacen().max({artefacto => artefacto.poder()})
    }

}


object libroDeHechizos{

    const hechizos = []
    var poder = 0
    var personajeActual = rolando

    method personajeActual(){
        return personajeActual
    }

    method personajeActual(_personajeActual){
        personajeActual = _personajeActual
    }

    method poder(){
        return poder
    }

    method calcularPoder(){
        if(hechizos.isEmpty()){
            poder = 0
        } else {
            poder = hechizos.first().poder() 
            hechizos.remove(hechizos.first())
        }
         
    }

    method hechizos(){
        return hechizos
    }

    method agregarHechizos(hechizo){
        hechizos.add(hechizo)
    }

}


object collarDivino{

    var poder = 3
    var personajeActual = rolando
    
    method poder() {
        return poder
    }

    method personajeActual(){
        return personajeActual
    }

    method personajeActual(_personajeActual){
        personajeActual = _personajeActual
    }

    method poderCollar(){
        if(personajeActual.poderBase() > 6){
            poder = poder + 1
        }
    }


}
object armaduraDeAceroValyrio{

    const poder = 6

    method poder() {
        return poder
    }

}

object espadaDelDestino{

    var poder = 0
    var personajeActual = rolando
    var fueUsada = false

    method personajeActual(){
        return personajeActual
    }

    method personajeActual(_personajeActual){
        personajeActual = _personajeActual
    }

    method poder() {
        return poder
    }

    method poderEspada(){
        if(fueUsada){
            poder = personajeActual.poderBase() / 2
        } else {
            poder = personajeActual.poderBase()
            fueUsada = true
        }
        poder = personajeActual.poderBase()
    }

}


object castillo {
    const almacen = #{}

    method almacen() {
        return almacen
    } 

}
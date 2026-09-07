object rolando {
 
    const mochila  = #{}
    var capacidadMochila = 2
    var hogar = castillo
    const historialArtefactos = []

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

}

object libroDeHechizos{}
object collarDivino{}
object armaduraDeAceroValyrio{}
object espadaDelDestino{}


object castillo {
    const almacen = #{}

    method almacen() {
        return almacen
    } 

}

class Lugar{
	const property senderos = []
	const property id
	
	method seConecta(otroLugar) = senderos.any({sendero => sendero.destino()==otroLugar})
	
	method agregarSendero(sendero){
		senderos.add(sendero)
	}
}

class Sendero {
	const property destino
	const property distancia
	
}
class Persona{
	var property lugar
	var velocidad = 0
	var property horas = 0
	
	method velocidadCiudad() = velocidad
	method velocidadCampo() = velocidad
	
	method tiempoEnLlegar(destino) {
		
		

		return lugar.senderos().find({sendero => sendero.destino().id() == 2}).tiempo(self)
		
		//const aux = lugar.senderos().filter({sendero => sendero.destino().id() == destino.id()})
		//return aux.min({sendero => sendero.tiempo(self)}).tiempo(self)
		} 
	
	method realizarTarea(tarea){
		if (tarea.puedeHacer(self)){
			tarea.serRealizada(self)
			horas -= tarea.duracion(self)
		}else {
			self.error("no se puede realizar esta tarea")
		}
	}
	
}

class PersonaVelocidadesDiferentes inherits Persona{
	
	var velocidadCiudad
	var velocidadCampo
	
	override method velocidadCiudad() = velocidadCiudad
	override method velocidadCampo() = velocidadCampo
	
}

class SenderoUrbano inherits Sendero {
	const multiplicador = 1
	
	method tiempo(persona) = (distancia/persona.velocidadCiudad()).roundUp(0)*multiplicador
	
	
}

class SenderoRural inherits Sendero {
	method tiempo(persona) = (distancia/persona.velocidadCampo()).roundUp(0)
}

class Tarea{
	
	method puedeHacer(persona)
	
	method duracion(persona)
	
	method serRealizada(persona)
	
}

class IrA inherits Tarea {
	const property destino
	
	override method puedeHacer(persona) = persona.lugar().senderos().any({sendero => sendero.destino()==destino}) && self.duracion(persona) <= persona.horas()
	
	override method duracion(persona) = persona.tiempoEnLlegar(destino)
	
	override method serRealizada(persona) {
		persona.lugar(destino)
	}
	
}
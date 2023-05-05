Algoritmo PruebaBack
	Imprimir "Bienvenido a Viajes Opi Travel"
	
	Escribir "Tenemos una oferta de viajes amplia, caracterizada por"
	Escribir "Viajes turísticos, viajes de negocios, viajes vacaionales, etc"
	definir s Como Caracter
	Mientras s <> "S" Hacer
		Escribir "1. Viaje a Santa Marta $1480000"
		Escribir "2. Viaje de negocios a Nueva York $3000000"
		Escribir "3. Viaje de aventura por el Amazonas $2500000"
		Escribir "4. Vacaciones relajantes en San Andrés $1250000"
		
		Escribir "Elija una de las opciones"
		leer opt
		
		Escribir "¿Está seguro de querer reservar el viaje ", opt, "?"
		Escribir "S/N"
		leer s
	Fin Mientras
	Imprimir "por favor ingrese los siguientes datos:"
	definir nombre, apellido, email, telefono Como Caracter
	Definir edad, opt Como Entero
	Escribir "Nombre"
	leer nombre
	Escribir "Apellido"
	leer apellido
	Escribir "Edad"
	leer edad
	Escribir "email"
	leer email
	Escribir "teléfono"
	leer telefono
	definir mp, total Como Entero
	Mientras s <> "S" Hacer
		Escribir "Seleccione un método de pago:"
		Escribir "1. Efectivo (Comisión 0%)"
		Escribir "2. Débito (Comisión 0.7%)"
		Escribir "3. Crédito (Comisión 3%)"
		
		leer mp
		Escribir "Escogió el método ", mp
		Segun mp Hacer
			mp == 1:
				total = 1480000
			mp == 2:
				total = total + (total * 0.007)
			mp == 3:
				total = total + (total * 0.03)
			De Otro Modo:
				Escribir "Seleccione una opción válida"
		Fin Segun
		
		Escribir "El valor de la reserva será de: ", total
		Escribir "¿Está seguro?"
		Escribir "S/N"
		leer s
	Fin Mientras
	
	Escribir "Muchas gracias por su reserva"

FinAlgoritmo

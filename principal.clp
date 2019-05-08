(deftemplate persona "datos de una persona"
	(slot edad (type STRING))
	(slot altura (type INTEGER))
	(slot sexo(type STRING))
	(slot peso (type FLOAT))
)

;Comprobar interrogaciones en read

(defrule lee-edad
	(initial-fact)
=>
	(printout t "Introduzca la edad" crlf)
	(assert (edad (read))
)

(defrule lee-altura
	(initial-fact)
=>
	(printout t "Introduzca la altura (en cm)" crlf)
	(assert (altura (read))
)

(defrule lee-sexo
	(initial-fact)
=>
	(printout t "Introduzca el sexo (H o M)" crlf)
	(assert (sexo (read))
	
)

(defrule lee-peso
	(initial-fact)
	?declare (salience -10)
=>
	(printout t "Introduzca el peso (en KG)" crlf)
	(assert (peso (read))
	
	if(eq sexo H)
		then 
		?ideal <- (?altura - 100) * 0.9
	else
		?ideal <- (?altura - 100) 
 	
)

(defrule OPCIONES
	(printout t " PERDER " crlf)
	(printout t " MANTENERSE " crlf)
	(printout t " GANAR " crlf)
	(printout t " ¿QUE DESEAS HACER? " crlf)
	(assert (respuesta (read)))
)

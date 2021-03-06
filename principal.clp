(deftemplate persona "datos de una persona"
	(slot edad (type STRING))
	(slot altura (type INTEGER))
	(slot sexo(type STRING))
	(slot peso (type FLOAT))
)

(defglobal 
	?*r* = 0)

;Comprobar interrogaciones en read

;----------------------------------------------------------------

(defrule lee-edad
	(initial-fact)
=>
	(printout t "Introduzca la edad" crlf)
	(assert (edad (read))
)

;----------------------------------------------------------------

(defrule lee-altura
	(initial-fact)
=>
	(printout t "Introduzca la altura (en cm)" crlf)
	(assert (altura (read))
)

;----------------------------------------------------------------

(defrule lee-sexo
	(initial-fact)
=>
	(printout t "Introduzca el sexo (H o M)" crlf)
	(assert (sexo (read))	
)

;----------------------------------------------------------------

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
		?ideal <- (?altura - 100) * 0.85
		
	(printout t "Tu peso ideal esta en: " ?ideal crlf)
 	
)

;----------------------------------------------------------------

(defrule calcular_imc
	?imc <- ?peso / (altura * altura)
=>
	if(and (or (eq ?sexo H) (eq ?sexo M) )(?imc < 18.5))
		then 
		(printout t "Tienes un peso por debajo de los normal" crlf)
		
	if(and (or (eq ?sexo H) (eq ?sexo M) ) (or ?imc>=18.5 ?imc<=24.9))
		then 
		(printout t "Tienes un peso normal" crlf)
		
	if(and (or (eq ?sexo H) (eq ?sexo M) ) (or ?imc>=25  ?imc<=29.9 ))
		then
		(printout t "Tienes sobrepeso" crlf)
		
	if(and (or (eq ?sexo H) (eq ?sexo M) ) (or ?imc >= 30))
		then
		(printout t "Tienes obesidad"  crlf)
)

;----------------------------------------------------------------

(defrule objetivo
	(printout t " PERDER " crlf)
	(printout t " MANTENERSE " crlf)
	(printout t " GANAR " crlf)
	(printout t " ¿QUE DESEAS HACER? " crlf)
	(assert (respuesta (read)))
)

;Preguntas al usuario

(printout t "+--------------------------------------------------------------------------------------------+" crlf)
(printout t "PREGUNTAS SOBRE HABITOS ALIMENTICEOS (Responda solo con SI o NO)" crlf)
(printout t "+--------------------------------------------------------------------------------------------+" crlf)

(printout t "¿Realiza 5 comidas al día?" crlf)
(assert comidas(read))
	if(eq comida SI)
		then
		?*r* <- (bind + ?*r* 0 )
	else
		?*r* <- (bind + ?*r* 10 )


(printout t "¿Sueles desayunar?" crlf)
(assert desayuno (read))
	if(eq desayuno SI)
		then
		?*r* <- (bind + ?*r* 0 )
	else
		?*r* <- (bind + ?*r* 10 )


(printout t "¿Consumes entre 3 y 5 piezas de fruta al día?" crlf)
(assert fruta (read))
	if(eq fruta SI)
		then
		?*r* <- (bind + ?*r* 0 )
	else
		?*r* <- (bind + ?*r* 10 )


(printout t "¿Cosumes entre 3 y 5 piezas de verdura al día?" crlf)
(assert verdura (read))
	if(eq verdura SI)
		then
		?*r* <- (bind + ?*r* 0 )
	else
		?*r* <- (bind + ?*r* 10 )


(printout t "¿Bebes entre 1 y 2 litros de agua al día?" crlf)
(assert agua (read))
	if(eq agua SI)
		then
		?*r* <- (bind + ?*r* 0 )
	else
		?*r* <- (bind + ?*r* 10 )


(printout t "¿Consumes 2-4 raciones de pescado a la semana?" crlf)
(assert pescado (read))
	if(eq pescado SI)
		then
		?*r* <- (bind + ?*r* 0 )
	else
		?*r* <- (bind + ?*r* 10 )


(printout t "¿Consumes 2-3 raciones de carne a la semana?" crlf)
(assert carne (read))
	if(eq carne SI)
		then
		?*r* <- (bind + ?*r* 0 )
	else
		?*r* <- (bind + ?*r* 10 )


(printout t "¿Sueles comer entre horas (picar)?" crlf)
(assert picar (read))
	if(eq picar SI)
		then
		?*r* <- (bind + ?*r* 10 )
	else
		?*r* <- (bind + ?*r* 0 )


(printout t "¿Desayuna o come a media mañana?" crlf)
(assert mediamanana (read))
	if(eq mediamanana SI)
		then
		?*r* <- (bind + ?*r* 0 )
	else
		?*r* <- (bind + ?*r* 10 )


(printout t "¿Consume 2-4 raciones de productos lacteos al día?" crlf)
(assert lacteos (read))
	if(eq lacteos SI)
		then
		?*r* <- (bind + ?*r* 0 )
	else
		?*r* <- (bind + ?*r* 10 )


(printout t "¿Consume snacks frecuentemente?" crlf)
(assert snacks (read))
	if(eq snacks SI)
		then
		?*r* <- (bind + ?*r* 10 )
	else
		?*r* <- (bind + ?*r* 0 )


(printout t "¿Toma alcohol?" crlf)
(assert alcohol (read))
	if(eq alcohol SI)
		then
		?*r* <- (bind + ?*r* 10 )
	else
		?*r* <- (bind + ?*r* 0 )


(printout t "¿Suele beber agua con las comidas?" crlf)
(assert aguacomida (read))
	if(eq aguacomida SI)
		then
		?*r* <- (bind + ?*r* 0 )
	else
		?*r* <- (bind + ?*r* 10 )


(printout t "¿Consume muchos alimentos ricos en azucar?" crlf)
(assert azucar (read))
	if(eq azucar SI)
		then
		?*r* <- (bind + ?*r* 10 )
	else
		?*r* <- (bind + ?*r* 0 )


(printout t "¿Estima que consume aproximadamente 2000 kcal al día?" crlf)
(assert kcal (read))
	if(eq kcal SI)
		then
		?*r* <- (bind + ?*r* 0 )
	else
		?*r* <- (bind + ?*r* 10 )


(printout t "¿Como en restaurantes de comida rapida con frecuencia?" crlf)
(assert fastfood (read))
	if(eq fastfood SI)
		then
		?*r* <- (bind + ?*r* 10 )
	else
		?*r* <- (bind + ?*r* 0 )


(printout t "+--------------------------------------------------------------------------------------------+" crlf)
(printout t "PREGUNTAS SOBRE ACTIVIDAD FISICA (Responda solo con SI o NO)" crlf)
(printout t "+--------------------------------------------------------------------------------------------+" crlf)

(printout t "¿Realiza al menos 3-5 horas de ejercicio a la semana?" crlf)
(assert ejercicio (read))
	if(eq ejercicio SI)
		then
		?*r* <- (bind + ?*r* 0 )
	else
		?*r* <- (bind + ?*r* 10 )


(printout t "¿Practicas algún deporte?" crlf)
(assert deporte (read))
	if(eq deporte SI)
		then
		?*r* <- (bind + ?*r* 0 )
	else
		?*r* <- (bind + ?*r* 10 )


(printout t "¿Es constante en la realización de actividad fisica?" crlf)
(assert constancia (read))
	if(eq constancia SI)
		then
		?*r* <- (bind + ?*r* 0 )
	else
		?*r* <- (bind + ?*r* 10 )


(printout t "¿Camina al menos media hora al dia?" crlf)
(assert camina (read))
	if(eq camina SI)
		then
		?*r* <- (bind + ?*r* 0 )
	else
		?*r* <- (bind + ?*r* 10 )


(printout t "¿Va al gimnasio?" crlf)
(assert gimansio (read))
	if(eq gimansio SI)
		then
		?*r* <- (bind + ?*r* 0 )
	else
		?*r* <- (bind + ?*r* 10 )
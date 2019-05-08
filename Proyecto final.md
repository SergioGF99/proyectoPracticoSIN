; ---------
; Modulo MAIN 
; ---------

(defmodule MAIN (export ?ALL))

(deffacts control-foco
 (secuencia-fases PETICIONES PREGUNTAS EVALUACION))
 
(defrule cambio-fase
 ?f <- (secuencia-fases ?siguiente $?resto)
 =>
 (retract ?f)
 (focus ?siguiente)
 (assert (secuencia-fases $?resto ?siguiente)))
 
; ---------
; Modulo PETICIONES
; ---------

(defmodule PETICIONES (export deftemplate)
 (import MAIN deftemplate initial-fact))
 
; Peticiones datos al usuario
; defrule lee-altura
; COMPLETAR

; ---------
; Modulo PREGUNTAS
; ---------

?s <- ()


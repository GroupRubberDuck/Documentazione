#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Errore modifica codice nodo non valido"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che il sistema blocchi l'operazione di modifica e mostri un messaggio di errore se l'Utente inserisce un codice di lunghezza non compresa tra 4 e 10 caratteri
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)




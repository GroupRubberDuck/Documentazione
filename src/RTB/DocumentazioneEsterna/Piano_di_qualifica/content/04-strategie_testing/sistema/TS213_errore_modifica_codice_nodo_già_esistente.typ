#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Errore modifica codice nodo già esistente"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che il sistema blocchi l'operazione di modifca e mostri un messaggio di errore se l'Utente inserisce un codice già associato ad un altro nodo dello stesso decision tree

  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)




#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Errore nodo senza risposta selezionata"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che il sistema blocchi la navigazione dell'Utente verso un nodo successore e mostri un avviso, se il nodo corrente non ha una risposta associata
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)




#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Errore modifica codice requisito duplicato"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che il sistema blocchi l'operazione di modifica del codice associato al requisito e mostri un avviso se l'utente inserisce un codice già associato ad un altro requisito
],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)




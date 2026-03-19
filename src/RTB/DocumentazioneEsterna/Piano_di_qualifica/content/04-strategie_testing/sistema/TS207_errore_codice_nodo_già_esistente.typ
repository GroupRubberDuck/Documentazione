#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Errore codice nodo già esistente"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che il sistema interrompa l'operazione di inserimento del codice del nodo di decisione se l'utente inserisce un codice già associato a un nodo esistente 

  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)




#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Errore codice nodo non valido"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che il sistema interrompa l'operazione di inserimento del codice del nodo di decisione se l'utente inserisce un codice di lunghezza non compresa tra 4 e 10 caratteri 
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)




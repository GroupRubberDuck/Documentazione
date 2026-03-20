#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Errore codice requisito duplicato"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che il sistema blocchi l'operazione di inserimento del codice del requisito se l'Utente ha inserito un codice già associato ad un altro requisito
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)




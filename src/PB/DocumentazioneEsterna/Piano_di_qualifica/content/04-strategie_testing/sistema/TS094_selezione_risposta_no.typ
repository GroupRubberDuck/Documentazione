#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Selezione risposta no"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente possa selezionare la risposta NO alla domanda del nodo

  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"passed"

)




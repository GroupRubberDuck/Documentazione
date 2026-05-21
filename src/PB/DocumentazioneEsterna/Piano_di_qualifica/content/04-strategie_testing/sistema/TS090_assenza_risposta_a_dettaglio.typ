#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Assenza risposta a dettaglio"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente possa visualizzare l'assenza di una risposta associata al decision tree
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"Pass"

)




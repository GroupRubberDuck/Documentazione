#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Modifica anagrafica modello"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'utente possa modificare l'anagrafica del modello
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)




#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Annullamento aggiunta asset"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente possa annullare l'aggiunta dell'asset
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"passed"

)




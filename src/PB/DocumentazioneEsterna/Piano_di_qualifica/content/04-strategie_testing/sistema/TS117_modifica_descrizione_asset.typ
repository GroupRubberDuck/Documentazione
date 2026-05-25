#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Modifica descrizione asset"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'utente possa inserire una nuova descrizione da associare all'asset in fase di modifica dell'asset
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"passed"

)




#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Inserimento descrizione asset"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente possa inserire e salvare una descrizione per l'asset
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)




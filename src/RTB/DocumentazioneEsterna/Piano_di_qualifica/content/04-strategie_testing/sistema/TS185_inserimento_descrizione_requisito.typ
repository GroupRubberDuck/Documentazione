#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Inserimento descrizione requisito"

#let data=(

  nome:test-name,

  descrizione:[
    Verificare che l'Utente possa inserire e salvare una descrizione da associare al requisito
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)




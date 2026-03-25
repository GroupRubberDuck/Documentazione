#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Modifica descrizione requisito"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente possa inserire per la modifica e salvare una nuova descrizione del requisito
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)




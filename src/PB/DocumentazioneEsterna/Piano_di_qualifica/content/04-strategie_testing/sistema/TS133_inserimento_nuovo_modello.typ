#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Inserimento nuovo modello"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'utente possa inserire un nuovo modello nel sistema
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)




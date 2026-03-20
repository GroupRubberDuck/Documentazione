#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Eliminazione modello"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'utente possa eliminare un modello dal sistema
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)




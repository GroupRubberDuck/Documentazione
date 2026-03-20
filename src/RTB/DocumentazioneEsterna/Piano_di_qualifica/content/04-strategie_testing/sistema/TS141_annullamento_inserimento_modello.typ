#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Annullamento inserimento modello"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'utente possa annullare in qualsiasi momento l'operazione di inserimento del modello
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)




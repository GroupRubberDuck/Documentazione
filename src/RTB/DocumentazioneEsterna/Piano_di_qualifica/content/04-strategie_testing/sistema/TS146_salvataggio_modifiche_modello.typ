#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Salvataggio modifiche modello"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente possa salvare sul sistema le modifiche apportate alla struttura del modello
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)




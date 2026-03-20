#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Creazione nuovo modello"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'utente possa creare un nuovo modello nel sistema inserendone manualmente i dati

  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)




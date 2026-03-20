#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Selezione tipo asset"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente possa selezionare un tipo da associare all'asset in fase di creazione
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)




#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Selezione nuovo tipo network asset"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'utente possa selezionare il tipo network asset da associare all'asset in fase di modifica dell'asset

  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"Pass"

)




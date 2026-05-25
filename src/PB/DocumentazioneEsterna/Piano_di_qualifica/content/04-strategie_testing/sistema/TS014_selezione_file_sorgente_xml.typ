#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Selezione file sorgente xml"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente possa selezionare un file in formato XML
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"passed"

)




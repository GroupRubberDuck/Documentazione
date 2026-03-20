#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Selezione file sorgente csv"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente possa selezionare un file in formato CSV
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)




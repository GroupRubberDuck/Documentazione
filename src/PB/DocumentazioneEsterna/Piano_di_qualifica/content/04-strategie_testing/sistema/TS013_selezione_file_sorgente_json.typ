#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Selezione file sorgente json"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente possa selezionare un file in formato JSON
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"Pass"

)




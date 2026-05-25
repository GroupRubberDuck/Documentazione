#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Valuta asset"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente possa valutare uno specifico asset
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"passed"

)




#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Visualizzazione lista requisiti asset"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente possa visualizzare la lista dei requisiti
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)




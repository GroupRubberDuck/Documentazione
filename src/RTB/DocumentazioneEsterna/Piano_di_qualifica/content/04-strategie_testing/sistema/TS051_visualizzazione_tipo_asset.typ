#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Visualizzazione tipo asset"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente possa visualizzare il tipo dell'asset durante la visualizzazione della lista degli asset 

  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)




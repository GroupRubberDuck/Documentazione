#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Visualizzazione dettaglio nodo decisionale"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente possa visualizzare nel dettaglio il nodo del decision tree
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)




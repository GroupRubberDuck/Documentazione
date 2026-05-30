#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Visualizzazione stato attività nodo"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente possa visualizzare lo stato di attività del singolo nodo durante la visualizzazione del decision tree
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"passed"

)




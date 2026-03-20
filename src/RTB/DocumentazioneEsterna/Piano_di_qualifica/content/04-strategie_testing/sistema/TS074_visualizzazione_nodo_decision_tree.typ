#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Visualizzazione nodo decision tree"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente possa visualizzare le informazioni generali del singolo nodo durante la visualizzazione del decision tree
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)




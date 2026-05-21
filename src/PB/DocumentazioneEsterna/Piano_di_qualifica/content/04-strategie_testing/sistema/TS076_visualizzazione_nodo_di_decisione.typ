#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Visualizzazione nodo di decisione"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente possa visualizzare le informazioni generali del singolo nodo di decisione durante la visualizzazione del decision tree
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"Pass"

)




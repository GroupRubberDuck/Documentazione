#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Visualizzazione valore nodo foglia"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente possa visualizzare il risultato associato al singolo nodo foglia durante la visualizzazione del decision tree

  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"Pass"

)




#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Visualizzazione domanda nodo a dettaglio"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente possa visualizzare la domanda del nodo di decisione durante la visione in dettaglio del decision tree 

  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"passed"

)




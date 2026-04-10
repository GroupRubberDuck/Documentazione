#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Visualizzazione risposta nodo a dettaglio"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente possa visualizzare la risposta alla domanda del nodo di decisione durante la visione in dettaglio del decision tree 

  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)




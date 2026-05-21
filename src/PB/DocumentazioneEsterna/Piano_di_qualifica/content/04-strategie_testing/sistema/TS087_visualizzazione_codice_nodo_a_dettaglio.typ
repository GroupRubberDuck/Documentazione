#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Visualizzazione codice nodo a dettaglio"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente possa visualizzare il codice del nodo di decisione durante la visione in dettaglio del decision tree 
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"Pass"

)




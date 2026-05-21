#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Visualizzazione codice requisito a dettaglio"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente possa visualizzare il codice del requisito associato al decision tree di cui fa parte il nodo durante la visualizzazione del nodo
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"Pass"

)




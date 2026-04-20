#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Visualizzazione lista requisiti modello"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente possa visualizzare la lista dei requisiti previsti da uno specifico modello 
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)




#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Visualizzazione stato dipendenza"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente possa visualizzare lo stato dei valutazione del singolo requisito all'interno della lista delle dipendenze

  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)




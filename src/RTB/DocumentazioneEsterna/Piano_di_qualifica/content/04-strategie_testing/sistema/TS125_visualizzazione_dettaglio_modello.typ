#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Visualizzazione dettaglio modello"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'utente possa visualizzare le informazioni dettagliate di uno specifico modello

  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)




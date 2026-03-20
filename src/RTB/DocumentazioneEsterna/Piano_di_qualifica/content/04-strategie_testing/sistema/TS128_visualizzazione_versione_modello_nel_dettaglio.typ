#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Visualizzazione versione modello nel dettaglio"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'utente possa visualizzare il numero di versione del modello durante la visualizzazione dei dati nel dettaglio

  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)




#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Visualizzazione id modello"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'utente possa visualizzare l'id del modello durante la visualizzazione dei dati nel dettaglio
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)




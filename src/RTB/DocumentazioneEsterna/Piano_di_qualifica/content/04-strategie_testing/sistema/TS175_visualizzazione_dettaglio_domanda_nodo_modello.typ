#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Visualizzazione dettaglio domanda nodo modello"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'utente possa visualizzare la domanda associata allo specifico nodo visualizzato nel dettaglio in fase di modifica del modello

  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)




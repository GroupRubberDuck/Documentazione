#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Visualizzazione lista non dipendenze requisito modello"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente possa visualizzare la lista dei requisiti da cui il requisito non dipende durante la visualizzazione nel dettaglio in fase di modifica del modello

  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)




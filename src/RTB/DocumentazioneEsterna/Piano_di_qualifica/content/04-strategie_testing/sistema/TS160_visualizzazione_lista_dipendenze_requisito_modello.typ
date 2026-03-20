#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Visualizzazione lista dipendenze requisito modello"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente possa visualizzare la lista delle dipendenze del requisito durante la visualizzazione nel dettaglio in fase di modifica del modello
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)




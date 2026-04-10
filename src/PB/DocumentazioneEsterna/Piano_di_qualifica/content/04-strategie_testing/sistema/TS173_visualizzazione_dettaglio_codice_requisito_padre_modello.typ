#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Visualizzazione dettaglio codice requisito padre modello"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'utente possa visualizzare il codice del requisito a cui il modello di decision tree è associato in fase di modifica del modello
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)




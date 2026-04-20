#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Visualizzazione versione modello"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente possa visualizzare per ogni elemento della lista dei modelli il numero di versione del modello

  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)




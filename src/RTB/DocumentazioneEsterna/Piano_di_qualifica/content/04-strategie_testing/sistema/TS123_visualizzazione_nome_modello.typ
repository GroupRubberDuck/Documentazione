#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Visualizzazione nome modello"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'utente possa visualizzare per ogni elemento della lista dei modelli il nome del modello
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)




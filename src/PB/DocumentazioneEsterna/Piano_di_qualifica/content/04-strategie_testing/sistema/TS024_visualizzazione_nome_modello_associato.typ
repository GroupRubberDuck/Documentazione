#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Visualizzazione nome modello associato"

#let data=(

  nome:test-name,

  descrizione:[
    Verificare che l'Utente possa visualizzare il nome del modello da usare per la valutazione durante la visualizzazione del dettaglio del dispositivo
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"Pass"

)




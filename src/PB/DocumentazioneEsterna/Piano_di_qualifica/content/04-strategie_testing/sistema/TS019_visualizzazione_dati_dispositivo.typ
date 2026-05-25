#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Visualizzazione dati dispositivo"

#let data=(

  nome:test-name,

  descrizione:[
    Verificare che l'Utente possa visualizzare nel dettaglio le informazioni del dispositivo
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"passed"

)




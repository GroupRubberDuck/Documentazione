#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Visualizzazione dettaglio requisito"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente possa visualizzare le informazioni dettagliate del requisito
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"Pass"

)




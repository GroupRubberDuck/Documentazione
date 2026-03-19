#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Visualizzazione dettaglio asset"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente possa visualizzare le informazioni dettagliate di un asset specifico
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)




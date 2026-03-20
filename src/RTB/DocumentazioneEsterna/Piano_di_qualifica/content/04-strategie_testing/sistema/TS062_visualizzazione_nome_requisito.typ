#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Visualizzazione nome requisito"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente possa visualizzare il nome del requisito durante la visualizzazione nel dettaglio
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)




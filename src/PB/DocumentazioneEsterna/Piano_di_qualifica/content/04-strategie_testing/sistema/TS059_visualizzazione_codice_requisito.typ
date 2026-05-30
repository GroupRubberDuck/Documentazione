#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Visualizzazione codice requisito"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente possa visualizzare il codice del singolo requisito durante la visualizzazione della lista dei requisiti

  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"passed"

)




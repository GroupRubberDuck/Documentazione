#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Visualizzazione stato valutazione requisito"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente possa visualizzare lo stato di valutazione del singolo requisito durante la visualizzazione della lista dei requisiti

  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"Pass"

)



